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
      backColor       =   &c00000000
      Backdrop        =   0
      borderColor     =   &c00000000
      borderWidthDbl  =   0.0
      displayModeInt  =   0
      DoubleBuffer    =   False
      Enabled         =   True
      firstTabIndentInt=   0
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
      mouseOverTabBorderColor=   &c00000000
      Scope           =   0
      tabFixedHeightDbl=   0.0
      tabFixedWidthDbl=   0.0
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
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   177
   End
End
#tag EndWindow

#tag WindowCode
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
		  // SET GLOBAL SETTINGS FOR  MC TAB PANEL CONTROL
		  Me.backColor = kEditProfileGrayBackColor 
		  Me.borderColor = &c979797 
		  Me.mouseOverTabBorderColor = &cC7C7C7 
		  Me.borderWidthDbl = 1.0 
		  Me.tabFixedWidthDbl = 86 
		  Me.tabFixedHeightDbl = Me.Height
		  Me.displayModeInt = 0
		  Me.firstTabIndentInt = 20
		  Me.tabIconPictureWdbl = 24
		  Me.tabIconPictureHdbl = 24
		  
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
