Node = Struct.new(:value, :next, :prev)

class Lista

	def initialize(head, tail)
		@head = head
		@tail = tail
		@size = 0
	end
end
