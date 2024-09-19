#tag MobileScreen
Begin MobileScreen MainScreen Implements iOSMobileTableDataSource
   BackButtonCaption=   "Tasks"
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   True
   LargeTitleDisplayMode=   1
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "Tasks"
   Top             =   0
   Begin MainBlankSlateContainer BlankSlateContainer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   BlankSlateContainer, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BlankSlateContainer, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BlankSlateContainer, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BlankSlateContainer, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      Visible         =   False
      Width           =   320
      _ClosingFired   =   False
   End
   Begin iOSMobileTable ScreenTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   ScreenTable, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScreenTable, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScreenTable, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ScreenTable, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   2
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   65
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin TaskRepository Tasks
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   0
   End
   Begin MobileToolbarButton AddTaskButton
      Caption         =   "Untitled"
      Enabled         =   True
      Height          =   22
      Icon            =   0
      Left            =   290
      LockedInPosition=   False
      Scope           =   2
      Top             =   32
      Type            =   4
      Width           =   22.0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  Select Case button
		  Case AddTaskButton
		    AddTask
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddTask()
		  Var s As New CreateNewTaskScreen
		  AddHandler s.NewTaskAvailable, WeakAddressOf NewTaskAvailableHandler
		  s.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Return section = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClosingHandler(sender As SurveyTaskScreen)
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataChanged()
		  // Part of the dataNotificationReceiver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EditTask(task As SurveyTask)
		  Var editScreen As New SurveyTaskScreen
		  editScreen.Task = task
		  AddHandler editScreen.SavedPressed, WeakAddressOf SavedPressedHandler
		  AddHandler editScreen.Closing, WeakAddressOf ClosingHandler
		  
		  editScreen.Show(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewTaskAvailableHandler(sender As CreateNewTaskScreen, newTask As SurveyTask)
		  sender.Close
		  Tasks.Create(newTask)
		  EditTask(newTask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Refresh()
		  Var hasTasks As Boolean = Tasks.Count > 0
		  
		  ScreenTable.Visible = hasTasks
		  BlankSlateContainer.Visible = Not hasTasks
		  
		  If hasTasks Then
		    ScreenTable.ReloadDataSource
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Select Case section
		  Case 0
		    Return Tasks.Count
		  End Select
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Select Case section
		  Case 0
		    Var task As SurveyTask = Tasks.GetByRow(row)
		    If task = Nil Then
		      Return Nil
		    End If
		    
		    Return table.CreateCell(task.Title, task.CreatedAt.SQLDateTime, Tasks.TaskPreview(task.Id), MobileTableCellData.AccessoryTypes.Disclosure)
		  End Select
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RowEditingCompleted(table As iOSMobileTable, section As Integer, row As Integer, action As iOSMobileTable.RowEditingStyles)
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Select Case action
		  Case iOSMobileTable.RowEditingStyles.Delete
		    Var task As SurveyTask = Tasks.GetByRow(row)
		    Tasks.Delete(task.Id)
		    Refresh
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavedPressedHandler(sender As SurveyTaskScreen)
		  Tasks.Update(sender.Task.Id, sender.Task)
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Select Case section
		  Case 0
		    Return "Tasks (" + Tasks.Count.ToString + ")"
		  End Select
		  
		  Return ""
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events ScreenTable
	#tag Event
		Sub Opening()
		  Me.DataSource = Self
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  Select Case section
		  Case 0
		    EditTask(Tasks.GetByRow(row))
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Function ApplyActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var result() As iOSMobileTableRowAction
		  
		  result.Add(New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Destructive, "Delete", "delete"))
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
