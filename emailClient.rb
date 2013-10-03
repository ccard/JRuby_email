require_relative 'imports'

module EmailClient
 	class EmailClient
 		attr :mailFrom,:pass,:host,:prop,:session
 		def initialize(from,pass)
 			@mailFrom = from
 			@pass = pass
 			@host = 'aol.smtp.com'
 			@port = "993"
 		end

 		def startSession
 			@prop = Imports::System.getProperties
 			@prop.setProperty "mail.smtp.host",@host
 			@prop.setProperty "mail.smtp.port",@port
 			@prop.setProperty "mail.user",@mailFrom
 			@prop.setProperty "mail.password",@pass
 			@session = Imports::Session.getDefaultInstance @prop
 		end

 		def sendMessage(to,sub,text)
 			begin
 			message = Imports::MimeMessage.new @session
 			message.setFrom Imports::InternetAddress.new @mailFrom
 			message.addRecipient Imports::Message::RecipientType::TO,Imports::InternetAddress.new(to)
 			message.setSubject sub
 			message.setText text
 			Imports::Transport.send(message);

 			rescue Imports::MessagingException => e
 				e.printStackTrace
 			end
 		end
 	end
end