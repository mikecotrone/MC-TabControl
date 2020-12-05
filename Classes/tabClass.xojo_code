#tag Class
Protected Class tabClass
	#tag Method, Flags = &h0
		Sub Constructor(tabCaptionStr as String, optional tabIconPicture as Picture)
		  Me.tabCaptionStr = tabCaptionStr
		  Me.tabIconPicture = tabIconPicture
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		attachedContainer As ContainerControl
	#tag EndProperty

	#tag Property, Flags = &h0
		isDisabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isMouseOverBool As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isSelectedBool As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		tabActiveColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabActiveIconPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		tabCaptionStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		tabColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabHoverTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIconPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIndexInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tabRect As Rect
	#tag EndProperty

	#tag Property, Flags = &h0
		tabTextActiveColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabTextFontSizeInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tabTextFontStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		tabTopCurveDbl As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		useTabIconPictureBool As Boolean
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
			Name="tabCaptionStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabActiveIconPicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIndexInt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabTextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabTextActiveColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabActiveColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabTextFontStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabTextFontSizeInt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isSelectedBool"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isDisabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabHoverTextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isMouseOverBool"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="useTabIconPictureBool"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIconPicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabTopCurveDbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
