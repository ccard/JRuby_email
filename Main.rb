require_relative 'MainGui'
require_relative 'emailClient'
require 'rubygems'
require 'highline/import'

def get_pass(prompt="Enter Password")
	ask(prompt) {|q| q.echo = 'x'}
end
pass = get_pass

#mainframe = MainGui.new "EmailClient"

email = EmailClient::EmailClient.new "sukhoiscard@aol.com",pass

email.startSession
email.sendMessage "sukhoiscard@aol.com","test","me"