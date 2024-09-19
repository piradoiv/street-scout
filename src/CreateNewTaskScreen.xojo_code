#tag MobileScreen
Begin MobileScreen CreateNewTaskScreen
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
   Title           =   "Untitled"
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
      FillColor       =   PrimaryColorGroup
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
         Text            =   "Getting your current location..."
         TextColor       =   LightColorGroup
         TextFont        =   ""
         TextSize        =   30
         TintColor       =   &c000000
         Top             =   154
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
      Begin MobileProgressWheel Spinner
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Spinner, 9, BackgroundRectangle, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   Spinner, 8, , 0, False, +1.00, 4, 1, 24, , True
         AutoLayout      =   Spinner, 3, MessageLabel, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
         AutoLayout      =   Spinner, 7, , 0, False, +1.00, 4, 1, 24, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   24
         InitialParent   =   "BackgroundRectangle"
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "BackgroundRectangle"
         Scope           =   0
         Shade           =   0
         TintColor       =   &c000000
         Top             =   327
         Visible         =   True
         Width           =   24
         _ClosingFired   =   False
      End
      Begin MobileLabel MessageLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   1
         AutoLayout      =   MessageLabel, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   MessageLabel, 8, , 0, False, +1.00, 4, 1, 70, , True
         AutoLayout      =   MessageLabel, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   MessageLabel, 7, , 0, False, +1.00, 4, 1, 280, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   70
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
         Text            =   "Street Scout is currently trying to find your precise location."
         TextColor       =   LightColorGroup
         TextFont        =   ""
         TextSize        =   18
         TintColor       =   &c000000
         Top             =   249
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
   End
   Begin MobileLocation GPS
      Accuracy        =   1
      AllowBackgroundUpdates=   False
      AuthorizationState=   0
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   0
      VisitAwareness  =   False
   End
   Begin Timer GPSTimer
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   3000
      RunMode         =   0
      Scope           =   0
   End
   Begin MobileMessageBox LocationErrorMessageBox
      Left            =   0
      LeftButton      =   "Cancel"
      LockedInPosition=   False
      Message         =   "We couldn't find your location, please go to Settings and allow the app to use your Location, if needed."
      PanelIndex      =   -1
      Parent          =   ""
      RightButton     =   "Continue without location"
      Scope           =   0
      Title           =   "Cannot find you"
      Top             =   0
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
	#tag Event
		Sub Opening()
		  If GPS.AuthorizationState = MobileLocation.AuthorizationStates.NotDetermined Then
		    Timer.CallLater(2000, WeakAddressOf TryToGetLocation)
		    Return
		  End If
		  
		  TryToGetLocation
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddTask()
		  Var newTask As New SurveyTask
		  
		  If mLastLocation <> Nil Then
		    newTask.Location = mLastLocation
		    Var POIs() As String = mLastLocation.PointsOfInterest
		    If POIs <> Nil And POIs.Count > 0 Then
		      newTask.Title = POIs(0)
		    End If
		  End If
		  
		  RaiseEvent NewTaskAvailable(newTask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TryToGetLocation()
		  Var state As MobileLocation.AuthorizationStates = GPS.AuthorizationState
		  
		  Select Case GPS.AuthorizationState
		    
		    // We are good to go
		  Case MobileLocation.AuthorizationStates.AuthorizedAlways, _
		    MobileLocation.AuthorizationStates.AuthorizedAppInUse
		    GPS.Start
		    
		    // The user won't let us
		  Case MobileLocation.AuthorizationStates.Denied, _
		    MobileLocation.AuthorizationStates.Restricted
		    System.DebugLog(CurrentMethodName + ": Starting timer because authorization state is Denied or Restricted")
		    GPSTimer.RunMode = Timer.RunModes.Single
		    
		    // The user needs to decide
		  Case MobileLocation.AuthorizationStates.NotDetermined
		    GPS.RequestUsageAuthorization(MobileLocation.UsageTypes.AppInUse)
		    
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NewTaskAvailable(newTask As SurveyTask)
	#tag EndHook


	#tag Property, Flags = &h0
		mLastLocation As MapLocation
	#tag EndProperty


#tag EndWindowCode

#tag Events GPS
	#tag Event
		Sub AuthorizationStateChanged(state as MobileLocation.AuthorizationStates)
		  System.DebugLog(CurrentMethodName + ": " + Str(state))
		  
		  Select Case state
		  Case MobileLocation.AuthorizationStates.AuthorizedAlways, _
		    MobileLocation.AuthorizationStates.AuthorizedAppInUse, _
		    MobileLocation.AuthorizationStates.Restricted
		    GPS.Start
		  Case MobileLocation.AuthorizationStates.NotDetermined
		    Return
		  End Select
		  
		  System.DebugLog(CurrentMethodName + ": Starting timer")
		  GPSTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndEvent
	#tag Event
		Sub LocationChanged(latitude As Double, longitude As Double, accuracy As Double, altitude As Double, altitudeAccuracy As Double, course As Double, speed As Double)
		  System.DebugLog(CurrentMethodName + ": " + latitude.ToString + " - " + longitude.ToString + " accuracy: " + accuracy.ToString)
		  
		  mLastLocation = New MapLocation(latitude, longitude)
		  
		  If GPSTimer.RunMode <> Timer.RunModes.Single Then
		    System.DebugLog(CurrentMethodName + ": Starting timer")
		    GPSTimer.RunMode = Timer.RunModes.Single
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GPSTimer
	#tag Event
		Sub Run()
		  If mLastLocation = Nil Then
		    LocationErrorMessageBox.Show
		    Return
		  End If
		  
		  AddTask
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LocationErrorMessageBox
	#tag Event
		Sub Pressed(buttonIndex As Integer)
		  Select Case buttonIndex
		  Case 0 // Cancel
		    Self.Close
		  Case 1 // Create task without location
		    AddTask
		  End Select
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
