#tag Class
Protected Class TaskRepository
	#tag Method, Flags = &h0
		Sub AddPicture(id As String, photo As SurveyPhoto)
		  Var filename As String = photo.Id
		  
<<<<<<< Updated upstream
		  ResizePic(pic).Save(PicturesFolderItem(id).Child(filename), Picture.Formats.JPEG)
=======
		  photo.Photo.Save(OriginalPicturesFolderItem(id).Child(filename), Picture.Formats.HEIC)
		  ResizePic(photo.Photo).Save(PicturesFolderItem(id).Child(filename), Picture.Formats.JPEG)
>>>>>>> Stashed changes
		  UpdateTaskPreviewPicture(id, LastPictureIndex(id))
		  UpdateTaskPreviewPicture(id)
		  
		  Var metadata As FolderItem = MetadataFolderItem(photo.Id)
		  If metadata.Exists Then
		    metadata.Remove
		  End If
		  
		  Var json As New JSONItem
		  json.Compact = False
		  json.Value("id") = photo.Id
		  json.Value("task_id") = id
		  If photo.Location <> Nil Then
		    Var location As New JSONItem
		    location.Value("latitude") = photo.Location.X
		    location.Value("longitude") = photo.Location.Y
		    json.Value("location") = location
		  End If
		  
		  If photo.CreatedAt <> Nil Then
		    json.Value("created_at") = photo.CreatedAt.SecondsFrom1970
		  End If
		  
		  Var writer As TextOutputStream = TextOutputStream.Open(metadata)
		  writer.Write(json.ToString)
		  writer.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Var documents As FolderItem = DocumentsFolderItem
		  
		  Var result As Integer
		  For Each f As FolderItem In documents.Children(False)
		    If f.Name.EndsWith(".json") Then
		      result = result + 1
		    End If
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Create(task As SurveyTask)
		  Var clone As SurveyTask = task.Clone
		  
		  clone.Id = GenerateUUIDv4
		  task.Id = clone.Id
		  mLastAddedTaskId = clone.Id
		  
		  Var document As FolderItem = DocumentFolderItem(clone.Id)
		  If document.Exists Then
		    document.Remove
		  End If
		  
		  Var writer As TextOutputStream = TextOutputStream.Open(document)
		  writer.Write(clone.ToJSON.ToString)
		  writer.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(id As String)
		  Var task As SurveyTask = GetById(id)
		  If task <> Nil Then
		    For i As Integer = 0 To LastPictureIndex(id)
		      Var p As SurveyPhoto = PictureAt(id, i)
		      RemoveMetadata(p.Id)
		    Next
		  End If
		  task = Nil
		  
		  Var document As FolderItem = DocumentFolderItem(id)
		  If document.Exists Then
		    document.Remove
		  End If
		  
		  Var pictures As FolderItem = PicturesFolderItem(id)
		  If pictures.Exists And pictures.IsFolder Then
		    pictures.RemoveFolderAndContents
		  End If
		  
		  Var previews As FolderItem = PreviewPicturesFolderItem(id)
		  If previews.Exists And previews.IsFolder Then
		    previews.RemoveFolderAndContents
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DocumentFolderItem(id As String) As FolderItem
		  Return DocumentsFolderItem.Child(id + ".json")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DocumentsFolderItem() As FolderItem
		  Var tasks As FolderItem = App.DataPath.Child("tasks")
		  If Not tasks.Exists Then
		    tasks.CreateFolder
		  End If
		  
		  Return tasks
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAll() As SurveyTask()
		  Var result() As SurveyTask
		  
		  For i As Integer = 0 To LastRowIndex
		    result.Add(GetByRow(i))
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetById(id As String) As SurveyTask
		  Var document As FolderItem = DocumentFolderItem(id)
		  If Not document.Exists Then
		    Return Nil
		  End If
		  
		  Var reader As TextInputStream = TextInputStream.Open(document)
		  Var contents As String = reader.ReadAll
		  reader.Close
		  
		  Var json As New JSONItem(contents)
		  
		  Return SurveyTask.FromJSON(json)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetByRow(row As Integer) As SurveyTask
		  Var id As String = DocumentsFolderItem.ChildAt(row).Name.NthField(".", 1)
		  Return GetById(id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLastAddedTaskId() As String
		  Return mLastAddedTaskId
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastPictureIndex(id As String) As Integer
		  Return PictureCount(id) - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastRowIndex() As Integer
		  Return Count - 1
		End Function
	#tag EndMethod

<<<<<<< Updated upstream
	#tag Method, Flags = &h0
		Function PictureAt(id As String, index As Integer) As Picture
=======
	#tag Method, Flags = &h21
		Private Function MetadataFolderItem(id As String) As FolderItem
		  System.DebugLog(CurrentMethodName + ": '" + id + "'")
		  Var folder As FolderItem = App.DataPath.Child("metadata")
		  If Not folder.Exists Then
		    folder.CreateFolder
		  End If
		  
		  Return folder.Child(id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OriginalPicturesFolderItem(id As String) As FolderItem
		  Var pictures As FolderItem = App.DataPath.Child("original-pictures")
		  If Not pictures.Exists Then
		    pictures.CreateFolder
		  End If
		  
		  Var result As FolderItem = pictures.Child(id)
		  If Not result.Exists Then
		    result.CreateFolder
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureAt(id As String, index As Integer, original As Boolean = False) As SurveyPhoto
>>>>>>> Stashed changes
		  If index > LastPictureIndex(id) Then
		    Return Nil
		  End If
		  
		  Var file As FolderItem = PicturesFolderItem(id).ChildAt(index)
		  Var p As Picture = Picture.Open(file)
		  
<<<<<<< Updated upstream
		  Return p
=======
		  If original And Not file.Exists Then
		    Return PictureAt(id, index, False)
		  End If
		  
		  Var result As New SurveyPhoto
		  result.Photo = Picture.Open(file)
		  Var metadata As FolderItem = MetadataFolderItem(filename)
		  If metadata.Exists Then
		    Var reader As TextInputStream = TextInputStream.Open(metadata)
		    Var json As JSONItem = New JSONItem(reader.ReadAll)
		    reader.Close
		    
		    result.Id = json.Lookup("id", "")
		    If json.HasKey("created_at") Then
		      result.CreatedAt = New DateTime(json.Value("created_at").DoubleValue)
		    End If
		    
		    If json.HasKey("location") Then
		      Var location As JSONItem = json.Child("location")
		      result.Location = New Point(location.Value("latitude").DoubleValue, location.Value("longitude").DoubleValue)
		    End If
		  End If
		  
		  Return result
>>>>>>> Stashed changes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureCount(id As String) As Integer
		  Return PicturesFolderItem(id).Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureNameAt(id As String, row As Integer) As String
		  Var f As FolderItem = PicturesFolderItem(id)
		  If Not f.Exists Then
		    f.CreateFolder
		  End If
		  
		  If row > f.Count - 1 Then
		    Return ""
		  End If
		  
		  Return f.ChildAt(row).Name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PicturePreviewAt(id As String, row As Integer) As Picture
		  Var f As FolderItem = PreviewPicturesFolderItem(id).Child(PictureNameAt(id, row))
		  
		  If Not f.Exists Then
		    UpdateTaskPreviewPicture(id, row)
		  End If
		  
		  If f.Exists Then
		    #Pragma BreakOnExceptions False
		    Try
		      Return Picture.Open(f)
		    Catch e As RuntimeException
		      Return Nil
		    End Try
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PicturesFolderItem(id As String) As FolderItem
		  Var pictures As FolderItem = App.DataPath.Child("pictures")
		  If Not pictures.Exists Then
		    pictures.CreateFolder
		  End If
		  
		  Var result As FolderItem = pictures.Child(id)
		  If Not result.Exists Then
		    result.CreateFolder
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PreviewPicturesFolderItem(id As String) As FolderItem
		  Var thumbnails As FolderItem = App.DataPath.Child("thumbnails")
		  If Not thumbnails.Exists Then
		    thumbnails.CreateFolder
		  End If
		  
		  Var result As FolderItem = thumbnails.Child(id)
		  If Not result.Exists Then
		    result.CreateFolder
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveMetadata(id As String)
		  Var metadata As FolderItem = MetadataFolderItem(id)
		  If metadata.Exists Then
		    metadata.Remove
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePictureAt(id As String, index As Integer)
<<<<<<< Updated upstream
		  PreviewPicturesFolderItem(id).Child(PictureNameAt(id, index)).Remove
=======
		  Var filename As String = PictureNameAt(id, index)
		  MetadataFolderItem(filename).Remove
		  OriginalPicturesFolderItem(id).Child(filename).Remove
		  PreviewPicturesFolderItem(id).Child(filename).Remove
>>>>>>> Stashed changes
		  PicturesFolderItem(id).ChildAt(index).Remove
		  UpdateTaskPreviewPicture(id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ResizePic(pic As Picture) As Picture
		  Const w = 800
		  
		  If pic.Width <= w Then
		    Return pic
		  End If
		  
		  Var ratio As Double = w / pic.Width
		  Var newPic As New Picture(w, pic.Height * ratio)
		  Var g As Graphics = newPic.Graphics
		  g.DrawPicture(pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height)
		  
		  newPic.Metadata = pic.Metadata.Clone
		  newPic.Metadata.Value("CreatedAt") = DateTime.Now.SQLDateTime
		  
		  Return newPic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TaskPreview(id As String) As Picture
		  Return PicturePreviewAt(id, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(id As String, task As SurveyTask)
		  Var document As FolderItem = DocumentFolderItem(task.Id)
		  If document.Exists Then
		    document.Remove
		  End If
		  
		  Var writer As TextOutputStream = TextOutputStream.Open(document)
		  writer.Write(task.ToJSON.ToString)
		  writer.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTaskPreviewPicture(id As String, row As Integer = -1)
		  Const w = 50
		  
		  If row = -1 Then
		    row = 0
		  End If
		  
		  If LastPictureIndex(id) = -1 Then
		    Return
		  End If
		  
		  Var p As Picture = PictureAt(id, row).Photo
		  Var ratio As Double = w / p.Width
		  
		  Var preview As New Picture(w, p.Height * ratio)
		  Var g As Graphics = preview.Graphics
		  g.DrawPicture(p, 0, 0, g.Width, g.Height, 0, 0, p.Width, p.Height)
		  
		  preview.Save(PreviewPicturesFolderItem(id).Child(PictureNameAt(id, row)), Picture.Formats.JPEG, Picture.QualityLow)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mLastAddedTaskId As String
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
	#tag EndViewBehavior
End Class
#tag EndClass
