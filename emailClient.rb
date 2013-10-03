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
 			@prop = Imports::System.getProperties
 			@prop.setProperty "mail.smtp.host",@host
 			@session = Imports::Session.getDefaultInstance @prop
 		end

 		def sendMessage(to,sub,text)
 			begin
 			message = Imports::MimeMessage.new @session
 			message.setFrom Imports::InternetAddress.new @mailFrom
 			message.addRecipient Imports::Message::RecipientType::TO,Imports::InternetAddress.new(to)
 			message.setSubject sub
 			message.setText text
 			trans = @session.getTransport("smtp")
 			trans.connect @host,@port,@mailFrom,@pass
 			trans.sendMessage message,message.getAllRecipients()
 			trans.close
 			rescue Imports::MessagingException => e
 				e.printStackTrace
 			end
 		end
 	end
end