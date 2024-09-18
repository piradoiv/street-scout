#tag MobileScreen
Begin MobileScreen ViewTaskInMapScreen
   BackButtonCaption=   ""
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
   Begin MobileMapViewer TaskMapViewer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TaskMapViewer, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TaskMapViewer, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TaskMapViewer, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TaskMapViewer, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   503
      Latitude        =   0.0
      Left            =   0
      LockedInPosition=   False
      Longitude       =   0.0
      MapType         =   0
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      TrackMode       =   0
      Visible         =   True
      Width           =   320
      ZoomRadius      =   200.0
      _ClosingFired   =   False
   End
   Begin MobileToolbarButton Button1
      Caption         =   "Switch Mode"
      Enabled         =   True
      Height          =   22
      Icon            =   0
      Left            =   221
      LockedInPosition=   False
      Scope           =   2
      Top             =   32
      Type            =   1001
      Width           =   91.0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  TaskMapViewer.MapType = App.DefaultMapType
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  TaskMapViewer.MapType = If(TaskMapViewer.MapType = MobileMapViewer.MapTypes.Hybrid, MobileMapViewer.MapTypes.RoadMap, MobileMapViewer.MapTypes.Hybrid)
		  App.DefaultMapType = TaskMapViewer.MapType
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private mTask As SurveyTask
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTask
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTask = value
			  
			  Title = value.Title
			  
			  Var location As MapLocation = value.Location
			  TaskMapViewer.AddLocation(location)
			  TaskMapViewer.GoToLocation(location)
			End Set
		#tag EndSetter
		Task As SurveyTask
	#tag EndComputedProperty


#tag EndWindowCode

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
