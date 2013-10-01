require_relative 'imports'

module EmailClient
 	class EmailClient
 		attr :mailFrom,:pass,:host,:prop,:session
 		def initialize(from,pass)
 			@mailFrom = from
 			@pass = pass
 			@host = 'localhost'
 		end

 		def startSession
 			@prop = Imports::System.getProperties
 			@prop.setProperty "mail.smtp.host",@host
 			@session = Imports::Session.getDefaultInstance @prop
 		end

 		def sendMessage(to,sub,text)
 			message = Imports::MimeMessage.new @session
 			message.sentFrom Imports::InternetAddress.new @mailFrom
 		end
 	end
end