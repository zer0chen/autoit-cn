#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	_GDIPlus_Startup() ;initialize GDI+
	Local Const $iWidth = 600, $iHeight = 600, $iBgColor = 0x303030 ;$iBgColor format RRGGBB

	Local $hGUI = GUICreate("GDI+ example", $iWidth, $iHeight) ;create a test GUI
	GUISetBkColor($iBgColor, $hGUI) ;set GUI background color
	GUISetState()

	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI) ;create a graphics object from a window handle
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $GDIP_SMOOTHINGMODE_HIGHQUALITY) ;sets the graphics object rendering quality (antialiasing)
	Local $hPen = _GDIPlus_PenCreate(0xFFFEDCBA, 4) ;color format AARRGGBB (hex)

	_GDIPlus_GraphicsDrawRect($hGraphics, 150.5, 50.1, 280.25, 500.75, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	;cleanup GDI+ resources
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_Shutdown()
	GUIDelete($hGUI)
EndFunc   ;==>Example
