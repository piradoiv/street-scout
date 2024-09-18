#tag Class
Protected Class SurveyTask
	#tag Method, Flags = &h0
		Function Clone() As SurveyTask
		  Return SurveyTask.FromJSON(ToJSON)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  CreatedAt = DateTime.Now
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromJSON(json As JSONItem) As SurveyTask
		  Var result As New SurveyTask
		  
		  Var tz As TimeZone = New TimeZone(json.Lookup("timezone", TimeZone.Current.Abbreviation).StringValue)
		  
		  If json.HasKey("completed_at") Then
		    result.CompletedAt = New DateTime(json.Value("completed_at"), tz)
		  End If
		  
		  result.CreatedAt = New DateTime(json.Value("created_at"), tz)
		  result.Description = json.Value("description")
		  result.Id = json.Value("id")
		  
		  If json.HasKey("location") Then
		    Var loc As JSONItem = json.Child("location")
		    result.mLocationPoint = New Point(loc.Value("latitude").DoubleValue, loc.Value("longitude").DoubleValue)
		  End If
		  
		  result.Title = json.Value("title")
		  result.Notes = json.Lookup("notes", "")
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCompleted() As Boolean
		  Return CompletedAt <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJSON() As JSONItem
		  Var result As New JSONItem
		  
		  result.Value("timezone") = TimeZone.Current.Abbreviation
		  
		  If CompletedAt <> Nil Then
		    result.Value("completed_at") = CompletedAt.SecondsFrom1970
		  End If
		  
		  result.Value("created_at") = CreatedAt.SecondsFrom1970
		  result.Value("description") = Description
		  result.Value("id") = Id
		  
		  If Location <> Nil Then
		    Var loc As New JSONItem
		    loc.Value("latitude") = mLocationPoint.X
		    loc.Value("longitude") = mLocationPoint.Y
		    result.Value("location") = loc
		  End If
		  
		  result.Value("title") = Title
		  result.Value("notes") = Notes
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CompletedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		CreatedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Id As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return New MapLocation(mLocationPoint.X, mLocationPoint.Y)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLocationPoint = New Point(value.Latitude, value.Longitude)
			End Set
		#tag EndSetter
		Location As MapLocation
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLocationPoint As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Notes As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String = "Untitled"
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
			Name="Title"
			Visible=false
			Group="Behavior"
			InitialValue="Untitled"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
