#tag Class
Protected Class SurveyPhoto
	#tag Method, Flags = &h0
		Sub Constructor()
		  Id = GenerateUUIDv4
		  CreatedAt = DateTime.Now
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CreatedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		Filename As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Id As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Location As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Photo As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Photo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
