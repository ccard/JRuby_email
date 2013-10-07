require_relative "imports"

class LoginGui < Gui::JDialog
	attr :pass,:passField
	attr_reader :ready
	def initialize(email)
		super email
		@ready = false
		setSize 300,300
		button_ok = Gui::JButton.new "ok"
		button_ok.addActionListener Buttonpress.new
		label = Gui::JLabel.new "Enter Password"
		@passField = Gui::JPasswordField.new

		add label
		add @passField
		add button_ok
		setVisible true
	end

	def getPass
		@pass
	end

	class Buttonpress
 		include Gui::ActionListener
			def actionPerformed(e)
				@pass = @passField.getPassword
				@ready = true
			end
	end
end