$myfile = "d:\test3\logsmscl.txt"
$port = New-Object System.IO.Ports.SerialPort
$port.PortName = "COM3"
$port.open()
$port.Write("AT+CPMS?" + "`r")        #request count sms into modem
$t=$port.ReadLine()
$t=$port.ReadLine()
Get-date | Out-File $myfile -Encoding utf8 -append
echo "Show count sms message into GSM Modem:" | Out-File $myfile -append
echo "received : $t" | Out-File $myfile -append

echo "Clear sms message process:" | Out-File $myfile -append
$port.Write("AT+CMGD=1,4" + "`r")     #delete all sms massege into modem 
$s=$port.ReadLine()
$s=$port.ReadLine()
echo "received : $s" | Out-File $myfile -append
$port.Close()

echo "-----------EOF-----------" | Out-File $myfile -append

