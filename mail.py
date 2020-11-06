#!/usr/bin/python3
import smtplib
import cgi


sender = "A Test User <from@example.com>"
receiver = form.getvalue('email')
Subject = form.getvalue('subject')
body = form.getvalue('body')


message = f"""\
Subject: {subject}
To: {receiver}
From: {sender}

{body}"""

with smtplib.SMTP("smtp.mailtrap.io", 2525) as server:
    server.login("9742f19624053c", "9d81c13bc94247")
    server.sendmail(sender, receiver, message)


print("Message Sent")