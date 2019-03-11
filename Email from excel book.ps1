#Declare the file path and sheet name
$file = "C:\Users\mhn\Documents\passwords.xlsx"
$sheetName = "Sheet1"
#Create an instance of Excel.Application and Open Excel file
$objExcel = New-Object -ComObject Excel.Application
$workbook = $objExcel.Workbooks.Open($file)
$sheet = $workbook.Worksheets.Item($sheetName)
$objExcel.Visible=$false
#Count max row
$rowMax = ($sheet.UsedRange.Rows).count
#Declare the starting positions
$rowFName,$colFNmae = 1,1
$rowLname,$colLName = 1,2
$rowUName,$colUName = 1,3
$rowEmail,$colEmail = 1,4
$rowPass,$colPass = 1,5
#loop to get values and store it
for ($i=1; $i -le $rowMax-1; $i++)
{
$fname = $sheet.Cells.Item($rowFName+$i,$colFName).text
$lname = $sheet.Cells.Item($rowLName+$i,$colLName).text
$uname = $sheet.Cells.Item($rowUName+$i,$colUname).text
$email = $sheet.Cells.Item($rowEmail+$i,$colEmail).text
$pass = $sheet.Cells.Item($rowPass+$i,$colPass).text

Write-Host ("Sending mail $i to: "+$fname +" " + $lname)
#create COM object named Outlook 
$Outlook = New-Object -ComObject Outlook.Application 
#create Outlook MailItem named Mail using CreateItem() method 
$Mail = $Outlook.CreateItem(0) 
#add properties as desired 
$Mail.To = $email 
$mail.SentOnBehalfOfName = "ITsupport"
$mail.Importance = 2
$Mail.Subject = "New mail password" 
$Mail.Body = "Good day " + $fname +",`n" + "`n"+ "we are migrating our mail environment starting today at 17:00. `n" + "Because of the migration you will be getting an new password for your email.`n" + "After the migration you can login with the following details on the Webmail and in Outlook or other mail app.`n" + "`n" + "Your username is: " + $email + "`n" + "Your new password is: " + $pass + "`n" + "`n" + "Please note this somewhere down because you need it at first login.`n" + "`n" + "This is an automated e-mail so please do not respond.`n" + "`n" + "Best regards,`n" + "IT Team"

#send message 
$Mail.Send() 
#quit and cleanup 
$Outlook.Quit() 
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Outlook) | Out-Null
}
#close excel file
$objExcel.quit()