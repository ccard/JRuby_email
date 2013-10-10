require_relative 'imports'
class MainGui < Gui::JFrame
	attr :client
	def initialize(name,eclient)
		super name
		@client = eclient
		initUI
		addFields
	end

	def initUI
		setSize 300,300
		setDefaultCloseOperation Gui::JFrame::EXIT_ON_CLOSE
		setLocationRelativeTo nil
		setLayout Gui::GridBagLayout.new
		@constraint = Gui::GridBagConstraints.new
		@constraint.fill = Gui::GridBagConstraints::HORIZONTAL
		#@constraint.anchor = Gui::GridBagConstraints::NORTH
		setVisible true
	end

	def addFields
		labelFrom = Gui::JLabel.new "From:"
		@constraint.gridx = 0
		@constraint.gridy = 0
		@constraint.weightx = 0.5
		labelFrom.setVisible true
		add labelFrom,@constraint

		labelAddress = Gui::JLabel.new @client.mailFrom
		@constraint.ipady = 20
		@constraint.gridy = 0
		@constraint.gridx = 1
		@constraint.gridwidth = 2
		add labelAddress,@constraint

		labelTo = Gui::JLabel.new "To:"
		@constraint.gridx = 0
		@constraint.gridy = 1
		@constraint.weightx = 0.5
		add labelTo,@constraint

		fieldTo = Gui::JTextField.new
		@constraint.ipady = 20
		@constraint.gridy = 1
		@constraint.gridx = 1
		@constraint.gridwidth = 2
		add fieldTo,@constraint
		
		labelSub = Gui::JLabel.new "Subject:"
		fieldSubj = Gui::JTextField.new
		@body = Gui::JTextArea.new
		@body.setWrapStyleWord true
		@body.setLineWrap true
		button_send = Gui::JButton.new "Send"
	end

	def getBody
		@body.getText
	end

	def hideShow
		vis = isVisible
		setVisible (not vis)
	end
end