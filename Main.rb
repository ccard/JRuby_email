require_relative 'ComposeGui'
require_relative 'emailClient'
require_relative 'loginGui'


login = LoginGui.new "Login"

until login.ready

end

pass =  login.getPass
user = login.uname
login.close

email_client = EmailClient::EmailClient.new user,pass
email_client.startSession

ComposeGui.new "Compose", email_client