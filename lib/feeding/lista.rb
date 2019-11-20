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

	def extract_head
		if @head.nil?
			raise "Lista vacía"
		else
			if @head == @tail
				@size = 0
				@head = nil
				@tail = nil
			else
				@size -= 1
				aux = @head
				@head = aux[:next]
				@head[:prev] = nil
			end
		end
	end

	def extract_tail
		if @head.nil?
                        raise "Lista vacía"
                else
                        if @head == @tail
				@size = 0
                                @head = nil
                                @tail = nil
                        else
				@size -= 1
                                aux = @tail
                                @tail = aux[:prev]
                                @tail[:next] = nil
                        end
                end
	end

	def get_head
		if @head.nil?
			raise "Lista vacía"
		else
			@head
		end
	end

	def get_tail
		if @head.nil?
			raise "Lista vacía"
		else
			@tail
		end
	end

	def get_size
		@size
	end

	def insert_group(v_nodes)
		v_nodes.each do |nodo|
			self.insert_tail(nodo)
		end
	end

	def show_list
		lista = ""
		if @head.nil?
			raise "Lista vacía"
		else
			aux = @head
			while !aux.nil?
				lista << aux[:value].to_s
				aux = aux[:next]
			end
		end
		lista
	end


end
