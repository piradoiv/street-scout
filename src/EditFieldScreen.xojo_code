#tag MobileScreen
Begin MobileScreen EditFieldScreen
   BackButtonCaption=   "Edit Field"
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
   Title           =   "Untitled"
   Top             =   0
   Begin MobileRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 8, TextField1, 8, False, +1.00, 4, 1, 10, , True
      AutoLayout      =   Rectangle1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Rectangle1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      BorderColor     =   &c000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   28.0
      Enabled         =   True
      FillColor       =   EditFieldBackgroundColorGroup
      Height          =   48
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   73
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
      Begin MobileTextField TextField1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   0
         AllowAutoCorrection=   False
         AllowSpellChecking=   False
         AutoCapitalizationType=   0
         AutoLayout      =   TextField1, 8, , 0, False, +1.00, 4, 1, 38, , True
         AutoLayout      =   TextField1, 1, Rectangle1, 1, False, +1.00, 4, 1, *kStdControlGapH, , True
         AutoLayout      =   TextField1, 2, Rectangle1, 2, False, +1.00, 4, 1, -*kStdControlGapH, , True
         AutoLayout      =   TextField1, 10, Rectangle1, 10, False, +1.00, 4, 1, 0, , True
         BorderStyle     =   0
         ControlCount    =   0
         Enabled         =   True
         Height          =   38
         Hint            =   ""
         InputType       =   0
         Left            =   28
         LockedInPosition=   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Password        =   False
         ReadOnly        =   False
         ReturnCaption   =   9
         Scope           =   2
         SelectedText    =   ""
         SelectionLength =   0
         SelectionStart  =   0
         Text            =   ""
         TextColor       =   &c000000
         TextFont        =   ""
         TextSize        =   18
         TintColor       =   &c000000
         Top             =   78
         Visible         =   True
         Width           =   264
         _ClosingFired   =   False
      End
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  TextField1.SetFocus
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
			  TextField1.Text = value
			  mValue = value
			End Set
		#tag EndSetter
		Value As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events TextField1
	#tag Event
		Function ReturnPressed() As Boolean
		  Self.Close
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  mValue = Me.Text
		  RaiseEvent ValueChanged(mValue)
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
