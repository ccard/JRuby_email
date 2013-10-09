module Gui
	include Java
	import 'javax.swing.JFrame'
	import 'javax.swing.JDialog'
	import 'javax.swing.JLabel'
	import 'javax.swing.JPasswordField'
	import 'javax.swing.JButton'
	import 'java.awt.event.ActionListener'
	import 'java.awt.GridLayout'
	import 'java.awt.GridBagLayout'
	import 'java.awt.GridBagConstraints'
	import 'javax.swing.JTextField'
	import 'javax.swing.JTextArea'
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