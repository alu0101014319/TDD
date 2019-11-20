Node = Struct.new(:value, :next, :prev)

class Lista
	
	attr_accessor :node, :head, :tail	

	def initialize(head, tail)
		@head = head
		@tail = tail
		@size = 0
	end

	def insert_head(node)
		if @head.nil?
			@size = 1
			@head = Node.new(node, nil, nil)
			@tail = @head
		else
			@size += 1
			aux = @head
			@head[:prev] = Node.new(node, aux, nil)
			@head = @head[:prev]
		end
	end

	def insert_tail(node)
		if @head.nil?
			@size = 1
			@head = Node.new(node, nil, nil)
			@tail = @head
		else
			@size += 1
			aux = @tail
			@tail[:next] = Node.new(node, nil, aux)
			@tail = @tail[:next]
		end
	end

end
