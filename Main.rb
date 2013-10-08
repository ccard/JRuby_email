require_relative 'MainGui'
require_relative 'emailClient'
require_relative 'loginGui'
require 'rubygems'
require 'highline/import'


login = LoginGui.new "sukhoiscard@aol.com"

until login.ready

end

pass =  login.getPass
login.close
mainframe = MainGui.new "EmailClient"

email = EmailClient::EmailClient.new "sukhoiscard@aol.com",pass

#email.startSession
#email.sendMessage "sukhoiscard@aol.com","test","me"