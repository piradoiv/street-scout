#tag MobileScreen
Begin MobileScreen EditNoteScreen
   BackButtonCaption=   "Edit Note"
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "Notes"
   Top             =   0
   Begin MobileTextArea NotesTextArea
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   True
      AllowSpellChecking=   True
      AutoCapitalizationType=   2
      AutoLayout      =   NotesTextArea, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, FieldBottom, False
      AutoLayout      =   NotesTextArea, 4, BottomLayoutGuide, 3, False, +1.00, 3, 1, -*kStdControlGapV, , True
      AutoLayout      =   NotesTextArea, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   NotesTextArea, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   NotesTextArea, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderStyle     =   0
      ControlCount    =   0
      Enabled         =   True
      Height          =   487
      Left            =   20
      LockedInPosition=   False
      maximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   LabelColorGroup
      TextFont        =   ""
      TextSize        =   15
      TintColor       =   &c000000
      Top             =   73
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ValueChanged(value As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mValue As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  NotesTextArea.Text = value
			  mValue = value
			End Set
		#tag EndSetter
		Value As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events NotesTextArea
	#tag Event
		Sub TextChanged()
		  mValue = Me.Text
		  RaiseEvent ValueChanged(Me.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  // Constraint("FieldBottom").Active = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub FocusReceived()
		  // Constraint("FieldBottom").Active = False
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
	#tag ViewProperty
		Name="Value"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
