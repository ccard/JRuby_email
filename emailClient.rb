require_relative 'imports'

module EmailClient
 	class EmailClient
 		attr :mailFrom,:pass,:host,:prop,:session
 		def initialize(from,pass)
 			@mailFrom = from
 			@pass = pass
 			@host = 'smtp.aol.com'
 			@port = 587
 		end

 		def startSession
 			@prop = Email::System.getProperties
 			@prop.setProperty "mail.smtp.host",@host
 			@session = Email::Session.getDefaultInstance @prop
 		end

 		def sendMessage(to,sub,text)
 			begin
 			message = Email::MimeMessage.new @session
 			message.setFrom Email::InternetAddress.new @mailFrom
 			message.addRecipient Email::Message::RecipientType::TO,Email::InternetAddress.new(to)
 			message.setSubject sub
 			message.setText text
 			trans = @session.getTransport("smtp")
 			trans.connect @host,@port,@mailFrom,@pass
 			trans.sendMessage message,message.getAllRecipients()
 			trans.close
 			rescue Email::MessagingException => e
 				e.printStackTrace
 			end
 		end
 	end
end