#tag MobileContainer
Begin MobileContainer MainBlankSlateContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 1
   Height          =   391
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   268
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 8, , 0, False, +1.00, 4, 1, 160, , True
      AutoLayout      =   ImageViewer1, 10, <Parent>, 10, False, +1.00, 4, 1, -40, , True
      AutoLayout      =   ImageViewer1, 7, , 0, False, +1.00, 4, 1, 160, , True
      ControlCount    =   0
      DisplayMode     =   1
      Enabled         =   True
      Height          =   160
      Image           =   0
      Left            =   54
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   75
      URL             =   ""
      Visible         =   True
      Width           =   160
      _ClosingFired   =   False
   End
   Begin MobileLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   1
      AutoLayout      =   Label1, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 70, , True
      AutoLayout      =   Label1, 3, ImageViewer1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 4, 1, 176, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   70
      Left            =   46
      LineBreakMode   =   0
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   2
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Press on the ""+"" icon in the top right corner to create your first task."
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   16
      TintColor       =   &c000000
      Top             =   243
      Visible         =   True
      Width           =   176
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
#tag EndWindowCode

#tag Events ImageViewer1
	#tag Event
		Sub Opening()
		  Me.Image = Picture.SystemImage("questionmark.square.dashed", 60)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_ClosingFired"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="320"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="480"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
