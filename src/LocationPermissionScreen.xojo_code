#tag MobileScreen
Begin MobileScreen LocationPermissionScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   False
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "Location Required"
   Top             =   0
   Begin MobileRectangle BackgroundRectangle
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   BackgroundRectangle, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      BorderColor     =   &c000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   0.0
      Enabled         =   True
      FillColor       =   FullScreenBackgroundColorGroup
      Height          =   568
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
      Begin MobileLabel TitleLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   1
         AutoLayout      =   TitleLabel, 4, MessageLabel, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
         AutoLayout      =   TitleLabel, 8, , 0, False, +1.00, 2, 2, 87, , True
         AutoLayout      =   TitleLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
         AutoLayout      =   TitleLabel, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   87
         InitialParent   =   "BackgroundRectangle"
         Left            =   20
         LineBreakMode   =   0
         LockedInPosition=   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "BackgroundRectangle"
         Scope           =   0
         SelectedText    =   ""
         SelectionLength =   0
         SelectionStart  =   0
         Text            =   "Location Access Required"
         TextColor       =   LightColorGroup
         TextFont        =   ""
         TextSize        =   30
         TintColor       =   &c000000
         Top             =   120
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
      Begin MobileLabel MessageLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   1
         AutoLayout      =   MessageLabel, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   MessageLabel, 8, , 0, False, +1.00, 4, 1, 100, , True
         AutoLayout      =   MessageLabel, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   MessageLabel, 7, , 0, False, +1.00, 4, 1, 280, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   100
         InitialParent   =   "BackgroundRectangle"
         Left            =   20
         LineBreakMode   =   0
         LockedInPosition=   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "BackgroundRectangle"
         Scope           =   0
         SelectedText    =   ""
         SelectionLength =   0
         SelectionStart  =   0
         Text            =   "Street Scout needs access to your location to help you create mapping tasks. Please enable Location Services in Settings."
         TextColor       =   LightColorGroup
         TextFont        =   ""
         TextSize        =   18
         TintColor       =   &c000000
         Top             =   225
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
      Begin MobileButton OpenSettingsButton
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   OpenSettingsButton, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   OpenSettingsButton, 8, , 0, False, +1.00, 4, 1, 50, , True
         AutoLayout      =   OpenSettingsButton, 4, ContinueButton, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
         AutoLayout      =   OpenSettingsButton, 7, , 0, False, +1.00, 4, 1, 280, , True
         ButtonStyle     =   0
         CaptionAlignment=   3
         ControlCount    =   0
         Enabled         =   True
         Height          =   50
         InitialParent   =   "BackgroundRectangle"
         Left            =   20
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "BackgroundRectangle"
         Scope           =   0
         Text            =   "Open Settings"
         TextColor       =   &cFFFFFF
         TextFont        =   ""
         TextSize        =   0
         TintColor       =   PrimaryColorGroup
         Top             =   365
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
      Begin MobileButton ContinueButton
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   ContinueButton, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   ContinueButton, 8, , 0, False, +1.00, 4, 1, 50, , True
         AutoLayout      =   ContinueButton, 3, <Parent>, 4, False, +1.00, 4, 1, -*kStdGapCtlToViewV, , True
         AutoLayout      =   ContinueButton, 7, , 0, False, +1.00, 4, 1, 280, , True
         ButtonStyle     =   2
         CaptionAlignment=   3
         ControlCount    =   0
         Enabled         =   True
         Height          =   50
         InitialParent   =   "BackgroundRectangle"
         Left            =   20
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "BackgroundRectangle"
         Scope           =   0
         Text            =   "Continue Without Location"
         TextColor       =   PrimaryColorGroup
         TextFont        =   ""
         TextSize        =   0
         TintColor       =   &c000000
         Top             =   493
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Hook, Flags = &h0
		Event ContinueWithoutLocation()
	#tag EndHook


#tag EndWindowCode

#tag Events OpenSettingsButton
	#tag Event
		Sub Pressed()
		  Extensions.OpenAppSettings
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ContinueButton
	#tag Event
		Sub Pressed()
		  RaiseEvent ContinueWithoutLocation()
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