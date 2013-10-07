require_relative 'imports'
class MainGui < Gui::JFrame
	def initialize(name)
		super name

		initUI
	end

	def initUI
		setSize 300,300
		setDefaultCloseOperation Gui::JFrame::EXIT_ON_CLOSE
		setLocationRelativeTo nil
		setVisible true
	end

	def hideShow
		vis = isVisible
		setVisible (not vis)
	end
end