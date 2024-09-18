#tag Class
Protected Class App
Inherits MobileApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Sub Opening()
		  Self.TintColor = Color.Teal
		  
		  Select Case KeyValue("map_type")
		  Case "hybrid"
		    DefaultMapType = MobileMapViewer.MapTypes.Hybrid
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(exc As RuntimeException) As Boolean
		  #If DebugBuild
		    Break
		    System.DebugLog(exc.Message)
		    System.DebugLog(String.FromArray(exc.Stack, EndOfLine))
		  #Endif
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DataPath() As FolderItem
		  Var root As FolderItem = SpecialFolder.ApplicationSupport.Child("es.rcruz.streetscout")
		  If Not root.Exists Then
		    root.CreateFolder
		  End If
		  
		  Return root
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextId() As Integer
		  Var storedLastId As String = KeyValue("last_id")
		  If storedLastId = "" Then
		    storedLastId = "0"
		  End If
		  
		  Var result As Integer = storedLastId.Val + 1
		  
		  KeyValue("last_id") = Str(result)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KeyValue(key As String) As String
		  Return KVStore.Lookup(key, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub KeyValue(key As String, Assigns value As String)
		  Var store As FolderItem = DataPath.Child("kv-store.json")
		  Var json As JSONItem = New JSONItem(KVStore)
		  json.Value(key) = value
		  
		  If store.Exists Then
		    store.Remove
		  End If
		  
		  Var writer As TextOutputStream = TextOutputStream.Open(store)
		  writer.Write(json.ToString)
		  writer.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KVStore() As Dictionary
		  Var store As FolderItem = DataPath.Child("kv-store.json")
		  If Not store.Exists Then
		    Return New Dictionary
		  End If
		  
		  Var reader As TextInputStream = TextInputStream.Open(store)
		  Var data As String = reader.ReadAll
		  reader.Close
		  
		  #Pragma BreakOnExceptions False
		  Try
		    Return ParseJSON(data)
		  Catch e As JSONException
		    #If DebugBuild
		      System.DebugLog(e.Message)
		    #Endif
		    If store.Exists Then
		      store.Remove
		    End If
		    Return Nil
		  Catch e As RuntimeException
		    #If DebugBuild
		      System.DebugLog(e.Message)
		    #Endif
		    Return Nil
		  End Try
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDefaultMapType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaultMapType = value
			  
			  KeyValue("map_type") = If(value = MobileMapViewer.MapTypes.Hybrid, "hybrid", "")
			End Set
		#tag EndSetter
		DefaultMapType As MobileMapViewer.MapTypes
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDefaultMapType As MobileMapViewer.MapTypes = MobileMapViewer.MapTypes.RoadMap
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
			Name="_LaunchOptionsHandled"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconBadgeNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mDefaultMapType"
			Visible=false
			Group="Behavior"
			InitialValue="MobileMapViewer.MapTypes.RoadMap"
			Type="MobileMapViewer.MapTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - RoadMap"
				"1 - Satellite"
				"2 - Hybrid"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
