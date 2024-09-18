#tag MobileScreen
Begin MobileScreen ViewPictureScreen
   BackButtonCaption=   "asdf"
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
   Title           =   "Untitled"
   Top             =   0
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 4, PreviousButton, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      DisplayMode     =   1
      Enabled         =   True
      Height          =   428
      Image           =   0
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      URL             =   ""
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
   End
   Begin MobileButton PreviousButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PreviousButton, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PreviousButton, 8, , 0, False, +1.00, 4, 1, 75, , True
      AutoLayout      =   PreviousButton, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PreviousButton, 7, <Parent>, 7, False, +0.50, 4, 1, 0, , True
      Caption         =   "Previous"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   False
      Height          =   75
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   493
      Visible         =   True
      Width           =   160
      _ClosingFired   =   False
   End
   Begin MobileButton NextButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   NextButton, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   NextButton, 8, PreviousButton, 8, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   NextButton, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   NextButton, 7, , 0, False, +1.00, 4, 1, 160, , True
      Caption         =   "Next"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   False
      Height          =   75
      Left            =   160
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   493
      Visible         =   True
      Width           =   160
      _ClosingFired   =   False
   End
   Begin TaskRepository Tasks
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub Refresh()
		  Self.BackButtonCaption = "Hello"
		  
		  Title = "Picture #" + Str(mImageIndex + 1)
		  PreviousButton.Enabled = mImageIndex > 0
		  NextButton.Enabled = mImageIndex < Tasks.LastPictureIndex(Task.Id)
		  ImageViewer1.Image = Tasks.PictureAt(Task.Id, mImageIndex)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mImageIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mImageIndex = value
			  Refresh
			End Set
		#tag EndSetter
		ImageIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mImageIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTask As WeakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mTask <> Nil And mTask.Value <> Nil Then
			    Return SurveyTask(mTask.Value)
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTask = New WeakRef(value)
			End Set
		#tag EndSetter
		Task As SurveyTask
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events PreviousButton
	#tag Event
		Sub Pressed()
		  ImageIndex = mImageIndex - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextButton
	#tag Event
		Sub Pressed()
		  ImageIndex = mImageIndex + 1
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
		Name="ImageIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
