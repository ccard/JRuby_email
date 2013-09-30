require_relative 'imports'

class MainGui < Imports::JFrame
	def initialize
		super "Test"

		self.initUI
	end

	def initUI
		self.setSize 300,300
		self.setDefaultCloseOperation Imports::JFrame::EXIT_ON_CLOSE
		self.setLocationRelativeTo nil
		self.setVisible true
	end
end

MainGui.new