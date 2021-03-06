;要打开的文件
Local $file = FileOpen("test.txt", 0)

; 检查打开的文件是否可为读
If $file = -1 Then
	MsgBox(4096, "错误", "不能打开文件.")
	Exit
EndIf

; 每次读取一个字符,直到文件结束(译注:读中文必须设置为远大于1的值!)(译注的译注(thesnow):ANSI编码中,一个中文为两个字符(char)/字节)
While 1
	Local $chars = FileRead($file, 1)
	If @error = -1 Then ExitLoop
	MsgBox(4096, "读取的字符:", $chars)
WEnd

FileClose($file)
