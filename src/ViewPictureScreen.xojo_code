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
   Begin MobileImageViewer PhotoImageViewer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PhotoImageViewer, 4, NextButton, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   PhotoImageViewer, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PhotoImageViewer, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PhotoImageViewer, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      DisplayMode     =   1
      Enabled         =   True
      Height          =   420
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
      Scope           =   2
      Top             =   0
   End
   Begin MobileToolbarButton ToggleButton
      Caption         =   "View Map"
      Enabled         =   True
      Height          =   22
      Icon            =   0
      Left            =   227
      LockedInPosition=   False
      Scope           =   2
      Top             =   32
      Type            =   1001
      Width           =   70.0
   End
   Begin MobileMapViewer PhotoMapViewer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PhotoMapViewer, 8, PhotoImageViewer, 8, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PhotoMapViewer, 1, PhotoImageViewer, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PhotoMapViewer, 3, PhotoImageViewer, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   PhotoMapViewer, 7, PhotoImageViewer, 7, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   420
      Latitude        =   0.0
      Left            =   0
      LockedInPosition=   False
      Longitude       =   0.0
      MapType         =   0
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      TrackMode       =   0
      Visible         =   False
      Width           =   320
      ZoomRadius      =   1.0
      _ClosingFired   =   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  Select Case button
		  Case ToggleButton
		    If Map.Visible Then
		      Map.Visible = False
		      PhotoImageViewer.Visible = True
		      ToggleButton.Caption = "View Map"
		    Else
		      Map.Visible = True
		      PhotoImageViewer.Visible = False
		      ToggleButton.Caption = "View Photo"
		    End If
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function MapIcon(originalPic As Picture) As Picture
		  Const squareSize = 60
		  Const corner = 8
		  Var p As New Picture(squareSize + 10, 140)
		  Var g As Graphics = p.Graphics
		  Var padding As Double = corner * .8
		  
		  Var arrow As New GraphicsPath
		  arrow.MoveToPoint(g.Width / 2 - 10, g.Height / 2 - 10)
		  arrow.AddLineToPoint(g.Width / 2 + 10, g.Height / 2 - 10)
		  arrow.AddLineToPoint(g.Width / 2, g.Height / 2)
		  
		  g.DrawingColor = Color.LightGray
		  g.FillRoundRectangle(5, 0, squareSize, squareSize, corner, corner)
		  g.DrawingColor = Color.LightGray
		  g.FillPath(arrow)
		  
		  g.DrawingColor = Color.White
		  g.FillRoundRectangle(6, 1, squareSize - 2, squareSize - 2, corner, corner)
		  
		  g.SaveState
		  g.Translate(0, -1)
		  g.DrawingColor = Color.White
		  g.FillPath(arrow, True)
		  g.RestoreState
		  
		  g.DrawPicture(originalPic, padding + 5, padding, g.Width - 10 - padding * 2, g.Width - 10 - padding * 2, 0, 0, originalPic.Width, originalPic.Height)
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Refresh()
		  Self.BackButtonCaption = "Hello"
		  
		  Title = "Picture #" + Str(mImageIndex + 1)
		  PreviousButton.Enabled = mImageIndex > 0
		  NextButton.Enabled = mImageIndex < Tasks.LastPictureIndex(Task.Id)
		  
		  Var photo As SurveyPhoto = Tasks.PictureAt(Task.Id, mImageIndex)
		  PhotoImageViewer.Image = photo.Photo
		  
		  If mPhotoLocation = Nil Then
		    mPhotoLocation = New MapLocation(0, 0)
		    Map.AddLocation(mPhotoLocation)
		  End If
		  
		  mPhotoLocation.Icon = New Picture(1, 1)
		  If photo.Location <> Nil Then
		    mPhotoLocation.Icon = MapIcon(photo.Photo)
		    mPhotoLocation.MoveTo(photo.Location.X, photo.Location.Y)
		  End If
		  
		  Map.RemoveLocation(mPhotoLocation)
		  Map.AddLocation(mPhotoLocation)
		  
		  If photo.Location <> Nil Then
		    Map.GoToLocation(photo.Location.X, photo.Location.Y)
		  End If
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
		Private mPhotoLocation As MapLocation
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
