require_relative 'imports'
class ComposeGui < Gui::JFrame
	attr :client
	def initialize(name,eclient)
		super name
		@client = eclient
		initUI
		addFields
	end

	def initUI
		setSize 500,500
		setDefaultCloseOperation Gui::JFrame::EXIT_ON_CLOSE
		setLocationRelativeTo nil
		setLayout Gui::GridBagLayout.new
		@constraint = Gui::GridBagConstraints.new
		@constraint.fill = Gui::GridBagConstraints::BOTH
		setVisible true
	end

	def addFields
		labelFrom = Gui::JLabel.new "From:"
		@constraint.anchor = Gui::GridBagConstraints::NORTHWEST
		@constraint.gridx = 0
		@constraint.gridy = 0
		@constraint.weightx = 1
		add labelFrom,@constraint

		labelAddress = Gui::JLabel.new @client.mailFrom
		@constraint.ipady = 20
		@constraint.gridy = 0
		@constraint.gridx = 1
		@constraint.gridwidth = 2
		add labelAddress,@constraint

		labelTo = Gui::JLabel.new "To:"
		@constraint.gridwidth = 0
		@constraint.gridx = 0
		@constraint.gridy = 1
		@constraint.weightx = 0.5
		add labelTo,@constraint

		@fieldTo = Gui::JTextField.new
		@constraint.ipady = 20
		@constraint.gridy = 1
		@constraint.gridx = 1
		@constraint.gridwidth = 2
		add @fieldTo,@constraint
		
		labelSub = Gui::JLabel.new "Subject:"
		@constraint.gridx = 0
		@constraint.gridy = 2
		add labelSub,@constraint

		@fieldSubj = Gui::JTextField.new
		@constraint.ipady = 20
		@constraint.gridx = 1
		@constraint.gridy = 2
		@constraint.gridwidth = 2
		add @fieldSubj,@constraint

		@body = Gui::JTextArea.new
		@body.setWrapStyleWord true
		@body.setLineWrap true
		@constraint.gridy = 3
		@constraint.gridx = 0
		@constraint.gridwidth = 3
		@constraint.ipady = 50

		scroll = Gui::JScrollPane.new @body,Gui::JScrollPane::VERTICAL_SCROLLBAR_ALWAYS,Gui::JScrollPane::HORIZONTAL_SCROLLBAR_NEVER
		add scroll,@constraint

		button_send = Gui::JButton.new "Send"
		button_send.addActionListener Buttonsend.new self
		@constraint.gridx = 0
		@constraint.gridy = 4
		@constraint.gridwidth = 3
		@constraint.anchor = Gui::GridBagConstraints::SOUTH
		add button_send,@constraint
		repaint
	end

	def getSendInfo
		{:client => @client, :body => @body.getText, 
			:to => @fieldTo.getText, :subj => @fieldSubj.getText}
	end

	def hideShow
		vis = isVisible
		setVisible (not vis)
	end

	class Buttonsend
		include Gui::ActionListener
		def initialize(gui)
			@gui = gui
		end

		def actionPerformed(e)
			info = @gui.getSendInfo
			info[:client].sendMessage info[:to],info[:subj],info[:body]
			Email::System.exit 0
		end
	end
end