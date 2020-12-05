#tag Class
Protected Class mcTabPanelClass
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  // FIND WHICH TAB WE ARE OVER AND THEN RAISE EVENT HANDLER
		  Var i as Integer
		  Var thisTabClassArr() as tabClass = tabClassArray()
		  Var lc as Integer = thisTabClassArr.LastIndex
		  
		  For i = 0 to lc
		    // FIND OUR TAB INDEX
		    Var sysMouseX as Double = MoveX
		    Var sysMouseY as Double = MoveY
		    If thisTabClassArr(i).tabRect.Contains(sysMouseX, sysMouseY) Then
		      // MATCHED
		      Var thisTabIndexInt as Integer= thisTabClassArr(i).tabIndexInt
		      RaiseEvent TabEnter(thisTabIndexInt)
		      
		      thisTabClassArr(i).isMouseOverBool = False
		      Me.Invalidate(False)
		    End If
		  Next i
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  // FIND WHICH TAB WE ARE OVER AND THEN RAISE EVENT HANDLER
		  Var i as Integer
		  Var thisTabClassArr() as tabClass = tabClassArray()
		  Var lc as Integer = thisTabClassArr.LastIndex
		  
		  For i = 0 to lc
		    // FIND OUR TAB INDEX
		    Var sysMouseX as Double = MoveX
		    Var sysMouseY as Double = MoveY
		    If thisTabClassArr(i).tabRect.Contains(sysMouseX, sysMouseY) Then
		      // MATCHED
		      Var thisTabIndexInt as Integer= thisTabClassArr(i).tabIndexInt
		      RaiseEvent TabExit(thisTabIndexInt)
		      
		      thisTabClassArr(i).isMouseOverBool = False
		      Me.Invalidate(False)
		      
		    End If
		  Next i
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  MoveX = x
		  MoveY = y
		  
		  // FIND WHICH TAB WE ARE OVER AND THEN RAISE EVENT HANDLER
		  Var i as Integer
		  Var thisTabClassArr() as tabClass = tabClassArray()
		  Var lc as Integer = thisTabClassArr.LastIndex
		  
		  For i = 0 to lc
		    // FIND OUR TAB INDEX
		    Var sysMouseX as Double = MoveX
		    Var sysMouseY as Double = MoveY
		    If thisTabClassArr(i).tabRect.Contains(sysMouseX, sysMouseY) Then
		      // MATCHED
		      Var thisTabIndexInt as Integer= thisTabClassArr(i).tabIndexInt
		      RaiseEvent TabMove(thisTabIndexInt)
		      // HANDLE THE CROSS RECT MOUSE MOVE
		      thisTabClassArr(i).isMouseOverBool = True
		      Me.Invalidate(False)
		    Else
		      thisTabClassArr(i).isMouseOverBool = False
		      Me.Invalidate(False)
		    End If
		    
		  Next i
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Var i as Integer
		  Var thisTabClassArr() as tabClass = tabClassArray()
		  Var lc as Integer = thisTabClassArr.LastIndex
		  
		  // SET QA FLAG TO CATCH OUT OF BOUNDS CLICKS
		  Var isOutOfBoundBool as Boolean = checkBounds(x, y)
		  If isOutOfBoundBool = True Then Return
		  
		  For i = 0 to lc
		    // FIND OUR TAB INDEX
		    Var sysMouseX as Double = x
		    Var sysMouseY as Double = y
		    If thisTabClassArr(i).tabRect.Contains(sysMouseX, sysMouseY) Then
		      // MATCHED
		      Var thisTabIndexInt as Integer= thisTabClassArr(i).tabIndexInt
		      thisTabClassArr(i).isSelectedBool = True
		      RaiseEvent TabChange(thisTabIndexInt)
		      thisTabClassArr(i).isSelectedBool = True
		      If thisTabClassArr(i).attachedContainer <> Nil Then
		        thisTabClassArr(i).attachedContainer.Visible = True
		      End If
		      Me.Invalidate(False)
		      
		    Else
		      thisTabClassArr(i).isSelectedBool = False
		      If thisTabClassArr(i).attachedContainer <> Nil Then
		        thisTabClassArr(i).attachedContainer.Visible = False
		      End If
		      Me.Invalidate(False)
		      
		    End If
		  Next i
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.AntiAliasMode = Global.Graphics.AntiAliasModes.HighQuality
		  g.AntiAlias = True
		  
		  #IF TargetWindows = True Then
		    Me.DoubleBuffer = True
		  #ENDIF
		  
		  // DEFAULT BACKGROUND
		  g.DrawingColor = Me.BackColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  // PRE TAB UNDERLINE IF THE FIRSTTABINDENT IS > 0
		  If Me.firstTabIndentInt > 0 Then
		    // POST TAB UNDERLINE
		    Var lineX1pos As Double = 0
		    Var lineY1pos As Double =  g.Height-1
		    Var lineX2pos As Double = Me.firstTabIndentInt
		    Var lineY2pos As Double = g.Height-1
		    g.PenSize = Me.borderWidthDbl
		    g.DrawingColor = Me.borderColor
		    g.DrawLine(lineX1pos, lineY1pos, lineX2pos, lineY2pos)
		  End If
		  
		  // DRAW TABS
		  Var thisTabArr() As tabClass = Me.tabClassArray
		  Var lc As Integer = thisTabArr.LastIndex
		  Var i As Integer
		  
		  For i = 0 To lc
		    
		    // DRAW TAB
		    If thisTabArr(i).isDisabled = False Then
		      
		      // PRE CALCS
		      Var tabLeftDbl As Double = thisTabArr(i).tabRect.Left
		      Var tabTopDbl As Double = 0
		      Var tabW As Double = thisTabArr(i).tabRect.Width
		      Var tabH As Double = thisTabArr(i).tabRect.Height
		      
		      If thisTabArr(i).isSelectedBool = True Then
		        // FILL ACTIVE TAB BACKGROUND COLOR
		        Var tabActiveBackColor As Color = thisTabArr(i).tabActiveColor
		        Var tabActiveBackColorXpos As Double = thisTabArr(i).tabRect.Left
		        Var tabActiveBackColorYpos As Double = thisTabArr(i).tabRect.Top + 1
		        Var tabActiveBackColorW As Double = thisTabArr(i).tabRect.Width
		        Var tabActiveBackColorH As Double = thisTabArr(i).tabRect.Height
		        g.DrawingColor = tabActiveBackColor
		        g.FillRectangle(tabActiveBackColorXpos, tabActiveBackColorYpos, tabActiveBackColorW, tabActiveBackColorH)
		        
		        // ACTIVE TAB: DRAW PICTURE *OR* STRING
		        If thisTabArr(i).useTabIconPictureBool = True Then
		          Var tabActiveIconPicture As Picture =  thisTabArr(i).tabActiveIconPicture
		          If tabActiveIconPicture <> Nil Then
		            Call drawTabIcon(g, tabActiveIconPicture, tabLeftDbl,  tabTopDbl, tabW, tabH)
		          End If
		          
		          // ACTIVE TAB: DRAW BEZIER CURVED TAB
		          g.PenSize = Me.borderWidthDbl
		          g.DrawingColor = Me.borderColor
		          Var leftLineX1Pos As Double = thisTabArr(i).tabRect.Left
		          Dim heightDbl As Double = tabFixedHeightDbl
		          Dim curveDbl As Double = thisTabArr(i).tabTopCurveDbl
		          Dim widthDbl As Double = tabFixedWidthDbl - curveDbl
		          Dim offsetDbl As Double = leftLineX1Pos
		          Call drawBezierTabBorder(g, leftLineX1Pos, heightDbl, curveDbl, widthDbl, offsetDbl)
		          
		        Else
		          // ACTIVE TAB: DRAW STRING
		          Var tabActiveCaptionStr As String =  thisTabArr(i).tabCaptionStr
		          Var tabActiveTextActiveColor As Color = thisTabArr(i).tabTextActiveColor
		          g.DrawingColor = tabActiveTextActiveColor
		          Var tabActiveTextFontSizeInt As Integer = thisTabArr(i).tabTextFontSizeInt
		          g.FontSize = tabActiveTextFontSizeInt
		          Var tabActiveTextFontStr As String = thisTabArr(i).tabTextFontStr
		          g.FontName = tabActiveTextFontStr
		          Var tabActiveTextW As Double = g.TextWidth(tabActiveCaptionStr)
		          Var tabActiveTextH As Double = g.TextHeight(tabActiveCaptionStr, 200)
		          Var tabActiveTextXpos As Double = tabLeftDbl + tabW/2 - tabActiveTextW/2
		          Var tabActiveTextYpos As Double = tabTopDbl + tabH/2 + tabActiveTextH/2
		          g.DrawString(tabActiveCaptionStr, tabActiveTextXpos, tabActiveTextYpos)
		          
		          // ACTIVE TAB: DRAW BEZIER CURVED TAB
		          g.PenSize = Me.borderWidthDbl
		          g.DrawingColor = Me.borderColor
		          Var leftLineX1Pos As Double = thisTabArr(i).tabRect.Left
		          Dim heightDbl As Double = tabFixedHeightDbl
		          Dim curveDbl As Double = 3
		          Dim widthDbl As Double = tabFixedWidthDbl - curveDbl
		          Dim offsetDbl As Double = leftLineX1Pos
		          Call drawBezierTabBorder(g, leftLineX1Pos, heightDbl, curveDbl, widthDbl, offsetDbl)
		        End If
		        
		        
		      Elseif thisTabArr(i).isSelectedBool = False Then
		        
		        // NOT ACTIVE TAB: DRAW HIGHLIGHT TAB BEZIER BORDER WHEN MOVE OVER
		        If thisTabArr(i).isMouseOverBool = True Then
		          
		          // DRAW BEZIER CURVED TAB
		          g.DrawingColor = Me.mouseOverTabBorderColor
		          g.PenSize = Me.borderWidthDbl
		          g.DrawingColor = Me.borderColor
		          Var leftLineX1Pos As Double = thisTabArr(i).tabRect.Left - Me.borderWidthDbl
		          Var heightDbl As Double = tabFixedHeightDbl
		          Var curveDbl As Double = thisTabArr(i).tabTopCurveDbl
		          Var widthDbl As Double = (tabFixedWidthDbl - curveDbl) + Me.borderWidthDbl
		          Var offsetDbl As Double = leftLineX1Pos
		          Call drawBezierTabBorder(g, leftLineX1Pos, heightDbl, curveDbl, widthDbl, offsetDbl)
		          
		        End If
		        
		        // NOT ACTIVE TAB: DRAW PICTURE *OR* STRING
		        If thisTabArr(i).useTabIconPictureBool = True Then
		          Var tabIconPicture As Picture =  thisTabArr(i).tabIconPicture
		          If tabIconPicture <> Nil Then
		            Call drawTabIcon(g, tabIconPicture, tabLeftDbl,  tabTopDbl, tabW, tabH)
		          End If
		          
		          // NOT ACTIVE TAB:  DRAW BORDER UNDER
		          Var lineX1pos As Double = thisTabArr(i).tabRect.Left
		          Var lineY1pos As Double =  thisTabArr(i).tabRect.Bottom-1
		          Var lineX2pos As Double = thisTabArr(i).tabRect.Right
		          Var lineY2pos As Double = thisTabArr(i).tabRect.Bottom-1
		          g.PenSize = Me.borderWidthDbl
		          g.DrawingColor = Me.borderColor
		          g.DrawLine(lineX1pos, lineY1pos, lineX2pos, lineY2pos)
		          
		          
		        Else
		          // NOT ACTIVE TAB: DRAW NON-SELECTED TAB
		          Var tabCaptionStr As String =  thisTabArr(i).tabCaptionStr
		          Var tabTextActiveColor As Color = thisTabArr(i).tabTextColor
		          g.DrawingColor = tabTextActiveColor
		          Var tabTextFontSizeInt As Integer = thisTabArr(i).tabTextFontSizeInt
		          g.FontSize = tabTextFontSizeInt
		          Var tabTextFontStr As String = thisTabArr(i).tabTextFontStr
		          g.FontName = tabTextFontStr
		          Var tabTextW As Double = g.TextWidth(tabCaptionStr)
		          Var tabTextH As Double = g.TextHeight(tabCaptionStr, 200)
		          Var tabTextXpos As Double = tabLeftDbl + tabW/2 - tabTextW/2
		          Var tabTextYpos As Double = tabTopDbl + tabH/2 + tabTextH/2
		          g.DrawString(tabCaptionStr, tabTextXpos, tabTextYpos)
		          
		          // NOT ACTIVE TAB:  DRAW BORDER UNDER
		          Var lineX1pos As Double = thisTabArr(i).tabRect.Left
		          Var lineY1pos As Double =  thisTabArr(i).tabRect.Bottom-1
		          Var lineX2pos As Double = thisTabArr(i).tabRect.Right
		          Var lineY2pos As Double = thisTabArr(i).tabRect.Bottom-1
		          g.PenSize = Me.borderWidthDbl
		          g.DrawingColor = Me.borderColor
		          g.DrawLine(lineX1pos, lineY1pos, lineX2pos, lineY2pos)
		        End If
		        
		      End If
		      
		    End If
		    
		  Next i
		  
		  
		  Var lastLineX2 As Double = thisTabArr(lc).tabRect.Right
		  // POST TAB UNDERLINE
		  Var lineX1pos As Double = lastLineX2
		  Var lineY1pos As Double =  g.Height-1
		  Var lineX2pos As Double = g.Width
		  Var lineY2pos As Double = g.Height-1
		  g.PenSize = Me.borderWidthDbl
		  g.DrawingColor = Me.borderColor
		  g.DrawLine(lineX1pos, lineY1pos, lineX2pos, lineY2pos)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addTab(thisTabClass as tabClass)
		  // ADD CLASS TO ARRAY
		  tabClassArray.AddRow(thisTabClass)
		  Var thisIndexInt as Integer = tabClassArray.LastIndex
		  
		  // IF THIS IS THE FIRST INDEX THEN AUTO SELECT
		  If thisIndexInt = 0 Then 
		    tabClassArray(thisIndexInt).isSelectedBool = True
		  Else
		    tabClassArray(thisIndexInt).isSelectedBool = False
		  End If
		  
		  // CAPTURE TABINDEX IN ARRAY
		  tabClassArray(thisIndexInt).tabIndexInt = thisIndexInt
		  
		  // CALCULATE TAB'S RECT
		  if tabClassArray(thisIndexInt).tabRect = Nil Then
		    Var thisTabIndexInt as Integer = tabClassArray(thisIndexInt).tabIndexInt
		    Var rectW as Double = me.tabFixedWidthDbl
		    Var rectH as Double = me.tabFixedHeightDbl
		    Var rectXpos as Double
		    If thisTabIndexInt =  0 Then
		      rectXpos =  firstTabIndentInt
		    Else
		      Var prevIndexInt as Integer = thisIndexInt - 1
		      rectXpos =  tabClassArray(prevIndexInt).tabRect.right
		    end if
		    
		    Var rectYpos as Double = 0
		    tabClassArray(thisIndexInt).tabRect = New Rect(rectXpos, rectYpos, rectW, rectH)
		  end if
		  
		  // REDRAW CONTROL
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function checkBounds(x as Double, y as Double) As Boolean
		  // CHECK TO SEE IF THE X/Y ARE OUT OF BOUNDS
		  
		  Var i as Integer
		  Var thisTabArr() as tabClass = Me.tabClassArray()
		  Var lc as Integer = thisTabArr.LastIndex
		  Var cn as Integer
		  
		  For i = 0 to lc
		    Var oobBool as Boolean = thisTabArr(i).tabRect.Contains(x, y)
		    If oobBool = True Then
		      cn = cn + 1
		    End If
		  Next i
		  
		  // IF 0 CLICK IS OUT OF BOUNDS
		  If cn = 0 Then Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function drawBezierTabBorder(g as Graphics, leftLineX1Pos as Double, heightDbl as Double, curveDbl as Double, widthDbl as Double, offsetDbl as Double) As Boolean
		  g.AntiAliasMode = Global.Graphics.AntiAliasModes.HighQuality
		  g.AntiAlias = True
		  #IF TargetWindows = True Then
		    Self.DoubleBuffer = True
		  #ENDIF
		  
		  Var p As New GraphicsPath
		  p.MoveToPoint(g.PenSize / 2, heightDbl + g.PenSize / 2)
		  p.AddLineToPoint(offsetDbl + g.PenSize / 2, heightDbl + g.PenSize / 2)
		  p.AddLineToPoint(offsetDbl + g.PenSize / 2, curveDbl + g.PenSize / 2)
		  p.AddCurveToPoint(offsetDbl + g.PenSize / 2, curveDbl + g.PenSize / 2, offsetDbl + g.PenSize / 2, g.PenSize / 2, offsetDbl + curveDbl + g.PenSize / 2, g.PenSize / 2)
		  p.AddLineToPoint(offsetDbl + widthDbl - g.PenSize / 2, g.PenSize / 2)
		  p.MoveToPoint(offsetDbl + widthDbl + curveDbl - g.PenSize / 2, curveDbl + g.PenSize / 2)
		  p.AddCurveToPoint(offsetDbl + widthDbl + curveDbl - g.PenSize / 2, curveDbl + g.PenSize / 2, offsetDbl + widthDbl + curveDbl - g.PenSize / 2, g.PenSize / 2, offsetDbl + widthDbl - g.PenSize / 2, g.PenSize / 2)
		  p.MoveToPoint(offsetDbl + widthDbl + curveDbl - g.PenSize / 2, curveDbl + g.PenSize / 2)
		  p.AddLineToPoint(offsetDbl + widthDbl + curveDbl - g.PenSize / 2, heightDbl + g.PenSize / 2)
		  p.AddLineToPoint(offsetDbl + widthDbl + curveDbl + offsetDbl - g.PenSize / 2, heightDbl + g.PenSize / 2)
		  g.DrawPath(p, False)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function drawTabIcon(g as Graphics, tabActiveIconPicture as Picture, tabLeftDbl as Double, tabTopDbl as Double, tabW as Double, tabH as Double) As Boolean
		  g.AntiAliasMode = Global.Graphics.AntiAliasModes.HighQuality
		  g.AntiAlias = True
		  #IF TargetWindows = True Then
		    Self.DoubleBuffer = True
		  #ENDIF
		  
		  Var tabActiveIconImageW1 as Double = tabIconPictureWdbl
		  Var tabActiveIconImageH1 as Double = tabIconPictureHdbl
		  Var tabActiveIconXpos as Double = tabLeftDbl + tabW/2 - tabActiveIconImageW1/2
		  Var tabActiveIconYpos as Double = tabTopDbl + (tabH/2 - tabActiveIconImageH1/2)
		  Var tabActiveIconImageSx as Double = 0
		  Var tabActiveIconImageSy as Double = 0
		  Var tabActiveIconmageW2 as Double = tabActiveIconPicture.Width
		  Var tabActiveIconImageH2 as Double = tabActiveIconPicture.Height
		  g.DrawPicture(tabActiveIconPicture, tabActiveIconXpos, tabActiveIconYpos, tabActiveIconImageW1, tabActiveIconImageH1, tabActiveIconImageSx, tabActiveIconImageSy, tabActiveIconmageW2, tabActiveIconImageH2)
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TabChange(tabIndexInt as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TabEnter(tabIndexInt as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TabExit(tabIndexInt as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TabMove(tabIndexInt as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		backColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		borderColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		borderWidthDbl As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		displayModeInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		firstTabIndentInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		lastVisitedTabIndexInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseOverLastTabIndexInt As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseOverTabBorderColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moveX As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moveY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tabClassArray() As tabClass
	#tag EndProperty

	#tag Property, Flags = &h0
		tabFixedHeightDbl As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tabFixedWidthDbl As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIconPictureHdbl As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIconPictureWdbl As Double
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
			InitialValue=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="borderColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="borderWidthDbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="displayModeInt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabFixedWidthDbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabFixedHeightDbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="firstTabIndentInt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseOverTabBorderColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseOverLastTabIndexInt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastVisitedTabIndexInt"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="backColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIconPictureWdbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIconPictureHdbl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
