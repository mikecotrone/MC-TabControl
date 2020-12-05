#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   600
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1257129983
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "MC TabPanel Control"
   Type            =   0
   Visible         =   True
   Width           =   750
   Begin mcTabPanelClass mcTabPanel
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      BackColor       =   &cE8EAE900
      Backdrop        =   0
      BorderColor     =   &c68696900
      BorderWidth     =   1.0
      displayModeInt  =   0
      DoubleBuffer    =   False
      Enabled         =   True
      FirstTabIndent  =   20
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      lastVisitedTabIndexInt=   -1
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      mouseOverLastTabIndexInt=   0
      MouseOverTabBorderColor=   &cC7C7C700
      Scope           =   0
      TabFixedHeight  =   40.0
      TabFixedWidth   =   86.0
      TabIconPictureHeight=   24.0
      TabIconPictureWidth=   24.0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   67
      Transparent     =   True
      Visible         =   True
      Width           =   750
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "MC Tab Panel Demo"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   177
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  app.AllowAutoQuit = True
		  #If TargetWindows Then
		    me.Composite = true
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.AntiAliasMode = Global.Graphics.AntiAliasModes.HighQuality
		  g.AntiAlias = True
		  g.DrawingColor = kEditProfileGrayBackColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = *** READ ME FIRST
		README:
		
		
		1. Make a copy of the "tempalteBaseTab_Container", rename, and build out this container with your choice of controls etc.
		
		2. Go to the mcTabPanel.Open event and follow the example with comments to add your new tab and container
		
		3. See the mcTabPanel Events of: TabChange, TabEnter, TabExit and TabMove if you are interested in using them
		
		Thats it.
		 
		
	#tag EndNote


#tag EndWindowCode

#tag Events mcTabPanel
	#tag Event
		Sub Open()
		  // ---- CREATE TEST TAB  ---- //
		  Var testTabItem As New tabClass("Test Tab")
		  testTabItem.useTabIconPictureBool = True
		  testTabItem.tabActiveIconPicture = eggCollectionButtonImage
		  testTabItem.tabIconPicture = mpfRoundWhiteBgPicture
		  testTabItem.tabActiveColor = &cFFFFFF
		  testTabItem.tabColor = &cF7F7F7
		  testTabItem.tabTextActiveColor = &c857C7D
		  testTabItem.tabTextColor = &c6388B0
		  testTabItem.tabHoverTextColor = &c534D4E
		  testTabItem.tabTextFontSizeInt = 15
		  testTabItem.tabTextFontStr = "Heiti TC"
		  testTabItem.tabTopCurveDbl = 3
		  Me.addTab(testTabItem)
		  // ATTACH TEST TAB TO CONTAINER
		  Var testTabXpos As Double = 0
		  Var testTabYpos As Double =  Me.Top + Me.Height
		  Var myTestTabParentWindow As Window = Self
		  Var testContainer As New templateBaseTab_Container(testTabItem, myTestTabParentWindow, testTabXpos, testTabYpos, True)
		  
		  // ---- CREATE SECURITY TAB  ---- //
		  Var secTabItem As New tabClass("Security")
		  secTabItem.tabActiveColor = &cFFFFFF
		  secTabItem.tabColor = &cF7F7F7
		  secTabItem.tabTextActiveColor = &c857C7D
		  secTabItem.tabTextColor = &c6388B0
		  secTabItem.tabHoverTextColor = &c534D4E
		  secTabItem.tabTextFontSizeInt = 15
		  secTabItem.tabTextFontStr = "Heiti TC"
		  secTabItem.tabTopCurveDbl = 3
		  Me.addTab(secTabItem)
		  // ATTACH SEC TAB TO CONTAINER
		  Var attachSecTabX As Double = 0
		  Var attachSecTabY As Double =  Me.Top + Me.Height
		  Var mySecTabParentWindow As Window = Self
		  Var securityTabContainer as New securityTab_Container(secTabItem, mySecTabParentWindow, attachSecTabX, attachSecTabY, False)
		  
		  // ---- CREATE GENERAL TAB  ---- //
		  Var genTabItem As New tabClass("General")
		  genTabItem.tabActiveColor = &cFFFFFF
		  genTabItem.tabColor = &cF7F7F7
		  genTabItem.tabTextActiveColor = &c857C7D
		  genTabItem.tabTextColor = &c6388B0
		  genTabItem.tabHoverTextColor = &c534D4E
		  genTabItem.tabTextFontSizeInt = 15
		  genTabItem.tabTextFontStr = "Heiti TC"
		  genTabItem.tabTopCurveDbl = 3
		  Me.addTab(genTabItem)
		  // ATTACH GENERAL TAB TO CONTAINER
		  Var attachGenTabX As Double = 0
		  Var attachGenTabY As Double =  Me.Top + Me.Height
		  Var myGentabParentWindow As Window = Self
		  Var generalTabContainer as New generalTab_Container(genTabItem, myGentabParentWindow, attachGenTabX, attachGenTabY, False)
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabEnter(tabIndexInt as Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabExit(tabIndexInt as Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabMove(tabIndexInt as Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabChange(tabIndexInt as Integer)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
