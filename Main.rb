require_relative 'MainGui'
require_relative 'emailClient'
mainframe = MainGui.new "EmailClient"

email = EmailClient::EmailClient.new "sukhoiscard@aol.com","t"

email.startSession
email.sendMessage "sukhoiscard@aol.com","test","me"