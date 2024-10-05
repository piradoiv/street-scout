#tag MobileScreen
Begin MobileScreen SurveyTaskScreen Implements iOSMobileTableDataSourceEditing
   BackButtonCaption=   "Back"
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   True
   LargeTitleDisplayMode=   0
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "Survey Task"
   Top             =   0
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
   Begin MobileToolbarButton AddPictureButton
      Caption         =   "Add Picture"
      Enabled         =   True
      Height          =   22
      Icon            =   0
      Left            =   290
      LockedInPosition=   False
      Scope           =   2
      Top             =   32
      Type            =   15
      Width           =   22.0
   End
   Begin MobileImagePicker CameraImagePicker
      AllowEditing    =   False
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Source          =   1
      Top             =   0
   End
   Begin TaskRepository Tasks
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   0
   End
   Begin Timer TaskUpdaterTimer
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   250
      RunMode         =   0
      Scope           =   2
   End
   Begin MobileMessageBox DeleteMessageBox
      Left            =   0
      LeftButton      =   "Cancel"
      LockedInPosition=   False
      Message         =   "This task will be permanently removed, including its pictures."
      PanelIndex      =   -1
      Parent          =   ""
      RightButton     =   "Delete Task"
      Scope           =   2
      Title           =   "Delete this task"
      Top             =   0
   End
   Begin MobileSharingPanel Share
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   0
   End
   Begin MobileLocation GPS
      Accuracy        =   1
      AllowBackgroundUpdates=   False
      AuthorizationState=   ""
      Height          =   32
      Height          =   32
      Left            =   60
      Left            =   60
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   60
      Top             =   60
      VisitAwareness  =   False
      Width           =   32
      Width           =   32
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  Select Case button
		  Case AddPictureButton
		    AddPicture
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddPIcture()
		  #If TargetMobileSimulator
		    CameraImagePicker.Source = MobileImagePicker.Sources.Photos
		  #EndIf
		  
		  mLastLocation = Nil
		  GPS.Start
		  CameraImagePicker.Show(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Return section = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Refresh()
		  ScreenTable.ReloadDataSource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Select Case section
		  Case 0
		    Return 2
		  Case 1
		    If Task = Nil Then
		      Return 0
		    End If
		    
		    Return Tasks.PictureCount(Task.Id)
		  Case 2
		    Return 4
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Const IconSize = 20
		  Var cell As MobileTableCellData = table.CreateCell
		  
		  Select Case section
		  Case 0
		    Select Case row
		    Case 0
		      cell.Text = Task.CreatedAt.SQLDateTime
		      cell.DetailText = "Created At"
		      cell.Image = Picture.SystemImage("calendar.badge.clock", IconSize)
		      Return cell
		    Case 1
		      cell.Text = "View in the Map"
		      cell.Image = Picture.SystemImage("map", IconSize)
		      cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		      cell.Tag = ActionTypes.SeeOnMap
		      Return cell
		    End Select
		  Case 1
		    cell.Text = "Picture #" + Str(row + 1)
		    cell.DetailText = Tasks.PictureNameAt(Task.Id, row)
		    cell.Image = Tasks.PicturePreviewAt(Task.Id, row)
		    cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		    cell.Tag = ActionTypes.ViewPicture
		    Return cell
		  Case 2
		    Select Case row
		    Case 0
		      cell.Text = "Edit Title"
		      cell.Image = Picture.SystemImage("pencil", IconSize)
		      cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		      cell.Tag = ActionTypes.EditTitle
		      Return cell
		    Case 1
		      cell.Text = "Notes"
		      cell.Image = Picture.SystemImage("text.word.spacing", IconSize)
		      cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		      cell.Tag = ActionTypes.EditNotes
		      Return cell
		    Case 2
		      cell.Text = "Take a Picture"
		      cell.Image = Picture.SystemImage("camera", IconSize)
		      cell.Tag = ActionTypes.TakePicture
		      Return cell
		    Case 3
		      cell.Text = "Remove Task"
		      cell.DetailText = "This action cannot be undone"
		      cell.Image = Picture.SystemImage("trash", IconSize)
		      cell.Tag = ActionTypes.RemoveTask
		      Return cell
		    End Select
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RowEditingCompleted(table As iOSMobileTable, section As Integer, row As Integer, action As iOSMobileTable.RowEditingStyles)
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Select Case section
		  Case 1
		    Select Case action
		    Case iOSMobileTable.RowEditingStyles.Delete
		      Tasks.RemovePictureAt(Task.Id, row)
		      Refresh
		    End Select
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return 3
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Var result As String
		  
		  Select Case section
		  Case 0
		    result = "Info"
		  Case 1
		    result = "Pictures"
		    If Task <> Nil Then
		      result = result + " (" + Tasks.PictureCount(Task.Id).ToString + ")"
		    End If
		  Case 2
		    result = "Actions"
		  End Select
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ValueChangedHandler(sender As MobileScreen, value As String)
		  Select Case sender
		  Case IsA EditFieldScreen
		    Title = EditFieldScreen(sender).Value
		    Task.Title = Title
		    
		  Case IsA EditNoteScreen
		    Task.Notes = EditNoteScreen(sender).Value
		    
		  Else
		    Return
		    
		  End Select
		  
		  TaskUpdaterTimer.Reset
		  TaskUpdaterTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SavedPressed()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mLastLocation As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSurveyTask As SurveyTask
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSurveyTask
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Title = value.Title
			  mSurveyTask = value.Clone
			End Set
		#tag EndSetter
		Task As SurveyTask
	#tag EndComputedProperty


	#tag Enum, Name = ActionTypes, Flags = &h21
		None
		  EditTitle
		  EditNotes
		  SeeOnMap
		  TakePicture
		  ViewPicture
		  ShareThisPicture
		RemoveTask
	#tag EndEnum


#tag EndWindowCode

#tag Events ScreenTable
	#tag Event
		Sub Opening()
		  Me.DataSource = Self
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  Var cell As MobileTableCellData = Me.RowCellData(section, row)
		  
		  Select Case cell.Tag
		    
		  Case ActionTypes.SeeOnMap
		    If Task.Location = Nil Then
		      MessageBox("This task has been created without a location.")
		      Return
		    End If
		    Self.BackButtonCaption = "Back"
		    Var s As New ViewTaskInMapScreen
		    s.Task = Task
		    s.Show(Self)
		    
		  Case ActionTypes.EditTitle
		    Self.BackButtonCaption = "Back"
		    Var editField As New EditFieldScreen
		    AddHandler editField.ValueChanged, WeakAddressOf ValueChangedHandler
		    editField.Title = "Task Title"
		    editField.Value = Task.Title
		    editField.Show(Self)
		    
		  Case ActionTypes.EditNotes
		    Self.BackButtonCaption = "Back"
		    Var notesScreen As New EditNoteScreen
		    AddHandler notesScreen.ValueChanged, WeakAddressOf ValueChangedHandler
		    notesScreen.Value = Task.Notes
		    notesScreen.Show(Self)
		    
		  Case ActionTypes.TakePicture
		    AddPIcture
		    
		  Case ActionTypes.RemoveTask
		    DeleteMessageBox.Show
		    
		  Case ActionTypes.ViewPicture
		    Self.BackButtonCaption = Title
		    Var s As New ViewPictureScreen
		    s.Task = Task
		    s.ImageIndex = row
		    s.Show(Self)
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Function ApplyLeadingActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var actions() As iOSMobileTableRowAction
		  
		  If section <> 1 Then
		    Return actions
		  End If
		  
		  Var action As New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Normal, "Share", "share")
		  action.BackgroundColor = PrimaryColorGroup
		  actions.Add(action)
		  
		  Return actions
		End Function
	#tag EndEvent
	#tag Event
		Sub RowActionSelected(section As Integer, row As Integer, actionTag As Variant)
		  Select Case actionTag
		  Case "share"
		    If section <> 1 Then
		      Return
		    End If
		    
<<<<<<< Updated upstream
		    Var p As Picture = Tasks.PictureAt(Task.Id, row)
=======
		    Var p As Picture = Tasks.PictureAt(Task.Id, row, True).Photo
>>>>>>> Stashed changes
		    If p <> Nil Then
		      Share.SharePicture(p, Self, Me)
		    End If
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CameraImagePicker
	#tag Event
		Sub Selected(pic As Picture)
		  GPS.Stop
		  
		  Var photo As New SurveyPhoto
		  photo.Photo = pic
		  
		  If mLastLocation <> Nil Then
		    photo.Location = New Point(mLastLocation.Left.DoubleValue, mLastLocation.Right.DoubleValue)
		  End If
		  
		  Var repository As New TaskRepository
		  repository.AddPicture(Task.Id, photo)
		  
		  Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub Cancelled()
		  GPS.Stop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TaskUpdaterTimer
	#tag Event
		Sub Run()
		  Tasks.Update(Task.Id, Task)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteMessageBox
	#tag Event
		Sub Pressed(buttonIndex As Integer)
		  If buttonIndex = 1 Then
		    Tasks.Delete(Task.Id)
		    Self.Close
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GPS
	#tag Event
		Sub LocationChanged(latitude As Double, longitude As Double, accuracy As Double, altitude As Double, altitudeAccuracy As Double, course As Double, speed As Double)
		  mLastLocation = latitude : longitude
		End Sub
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
