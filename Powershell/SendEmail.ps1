$to = $args[0]
$cc = $args[1]
$Subject = $args[2]
$Body = $args[3]

$From = "Hector.Rodriguez@COMPANY.com"
#$To = "Hector.Rodriguez@COMPANY.com", "Harpreet.Chadha@COMPANY.com"
#$Cc = "AThirdUser@somewhere.com"
#$Attachment = "C:\users\Username\Documents\SomeTextFile.txt"
#$Subject = "Here's the Email Subject"
#$Body = "This is what I want to say"
#Server information
$SMTPServer = "higmx.COMPANY.com"
$SMTPPort = "25"

Send-MailMessage -From $From -to $To -Cc $cc -Subject $Subject $Body -SmtpServer $SMTPServer -port $SMTPPort –DeliveryNotificationOption OnSuccess