require_relative "imports"

class LoginGui < Gui::JDialog
	attr :pass,:passField,:ready
	def initialize(email)
		super nil
		@ready = false
		setTitle "Login"
		setSize 300,300
		setLayout Gui::GridLayout.new(3,1)
		@passField = Gui::JPasswordField.new
		button_ok = Gui::JButton.new "ok"
		button_ok.addActionListener Buttonpress.new(self)
		label = Gui::JLabel.new "Enter Password"

		add label
		add @passField
		add button_ok

		setVisible true
	end

	def pass=val
		@pass = val
	end

	def ready=val
		@ready = val
	end

	def ready
		@ready
	end

	def getField
		@passField
	end

	def getPass
		string = @pass.map {|c| c.chr}
		string.inject("") { |c, r| r= "#{c}#{r}" }
	end

	def close
		setVisible false
	end

	class Buttonpress
 		include Gui::ActionListener
 			def initialize(login)
 				@log = login
 			end

			def actionPerformed(e)
				@log.pass = @log.getField.getPassword
				@log.ready = true
			end
	end
end