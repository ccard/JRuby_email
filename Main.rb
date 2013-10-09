require_relative 'MainGui'
require_relative 'emailClient'
require_relative 'loginGui'


login = LoginGui.new "sukhoiscard@aol.com"

until login.ready

end

pass =  login.getPass
user = login.uname
login.close
mainframe = MainGui.new "EmailClient"

email = EmailClient::EmailClient.new user,pass

#email.startSession
#email.sendMessage "sukhoiscard@aol.com","test","me"