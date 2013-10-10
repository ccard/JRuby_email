require_relative "imports"

class LoginGui < Gui::JDialog
	attr :pass,:passField,:userName
	attr_reader :ready,:uname
	def initialize(name)
		super nil
		@ready = false
		setTitle name
		setSize 300,300
		setLayout Gui::GridLayout.new(3,2)
		@passField = Gui::JPasswordField.new
		@userName = Gui::JTextField.new
		button_ok = Gui::JButton.new "Login"
		button_ok.addActionListener OkButtonpress.new(self)
		button_cancle = Gui::JButton.new "Cancle"
		button_cancle.addActionListener CancelButtonpress.new(self)
		label = Gui::JLabel.new "User Name"
		label2 = Gui::JLabel.new "Password"

		add label
		add @userName
		add label2
		add @passField
		add button_ok
		add button_cancle

		setVisible true
	end

	def pass=val
		@pass = val
	end

	def ready=val
		@ready = val
	end

	def uname=val
		@uname = val
	end

	def getPass
		string = @pass.map {|c| c.chr}
		string.inject("") { |c, r| r= "#{c}#{r}" }
	end

	def close
		setVisible false
	end

	class CancelButtonpress
		include Gui::ActionListener
		def initialize(login)
			@log = login
		end
		def actionPerformed(e)
			Email::System.exit 0
		end
	end

	class OkButtonpress
 		include Gui::ActionListener
 			def initialize(login)
 				@log = login
 			end

			def actionPerformed(e)
				@log.uname = @log.userName.getText
				@log.pass = @log.passField.getPassword
				@log.ready = true
			end
	end
end