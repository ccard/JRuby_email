module Gui
	include Java
	import 'javax.swing.JFrame'
end

module Email
	include Java
	require 'javax.mail.jar'
	import 'java.lang.System'
	import 'javax.mail.Session'
	import 'javax.mail.MessagingException'
	import 'javax.mail.internet.MimeMessage'
	import 'javax.mail.internet.InternetAddress'
	import 'javax.mail.Message'
	import 'javax.mail.Transport'
	import 'javax.activation.*'
end