require_relative 'MainGui'
require_relative 'emailClient'
require_relative 'loginGui'
require 'rubygems'
require 'highline/import'

def get_pass(prompt="Enter Password")
	ask(prompt) {|q| q.echo = 'x'}
end
#pass = get_pass

login = LoginGui.new "sukhoiscard@aol.com"

until login.ready

end

puts login.getPass
#mainframe = MainGui.new "EmailClient"

#email = EmailClient::EmailClient.new "sukhoiscard@aol.com",pass

#email.startSession
#email.sendMessage "sukhoiscard@aol.com","test","me"