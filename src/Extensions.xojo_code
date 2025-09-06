#tag Module
Protected Module Extensions
	#tag Method, Flags = &h0
		Function GenerateUUIDv4() As String
		  #If TargetIOS Or TargetMacOS Then
		    Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		    Declare Function UUID Lib "Foundation" Selector "UUID" (class_id As Ptr) As Ptr
		    Declare Function UUIDString Lib "Foundation" Selector "UUIDString" (id As Ptr) As CFStringRef
		    
		    // Get the NSUUID class
		    Var uuidClass As Ptr = NSClassFromString("NSUUID")
		    
		    // Create a new UUID
		    Var uuidPtr As Ptr = UUID(uuidClass)
		    
		    // Get the UUID string
		    Var cfUUID As CFStringRef = UUIDString(uuidPtr)
		    
		    // Convert CFStringRef to String and return
		    Var result As String = cfUUID
		    
		    Return result.Lowercase
		  #Else
		    Break
		    Return ""
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenAppSettings()
		  #If TargetIOS Then
		    Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		    Declare Function sharedApplication Lib "UIKit" Selector "sharedApplication" (class_id As Ptr) As Ptr
		    Declare Function openURL Lib "UIKit" Selector "openURL:options:completionHandler:" (app_id As Ptr, url As Ptr, options As Ptr, handler As Ptr) As Boolean
		    Declare Function URLWithString Lib "Foundation" Selector "URLWithString:" (class_id As Ptr, urlString As CFStringRef) As Ptr
		    
		    // Get UIApplication class and shared instance
		    Var uiAppClass As Ptr = NSClassFromString("UIApplication")
		    Var sharedApp As Ptr = sharedApplication(uiAppClass)
		    
		    // Get NSURL class
		    Var nsurlClass As Ptr = NSClassFromString("NSURL")
		    
		    // Create URL for app settings
		    Var settingsURL As Ptr = URLWithString(nsurlClass, "app-settings:")
		    
		    // Open the settings URL
		    Call openURL(sharedApp, settingsURL, Nil, Nil)
		  #Endif
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
