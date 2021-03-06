;;这是一个 UDP 客户端
;;请先运行服务端

; 开始 UDP 服务
;==============================================
UDPStartup()

; 注册清理函数.
OnAutoItExitRegister("Cleanup")

; 打开一个"套接字"("SOCKET")
;==============================================
Local $socket = UDPOpen("127.0.0.1", 65532)
If @error <> 0 Then Exit

Local $n = 0
While 1
	Sleep(2000)
	$n = $n + 1
	Local $status = UDPSend($socket, "消息 #" & $n)
	If $status = 0 Then
		MsgBox(4096, "错误", "当发送 UDP 消息时发生错误: " & @error)
		Exit
	EndIf
WEnd

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
