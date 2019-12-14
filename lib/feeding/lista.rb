#encoding: utf-8
#Esta clase permite representar un lista doblemente enlazada para almacenar una serie de alimentos insertándolos tanto por la cabeza como por la cola.

#Author::      Eduardo Estévez Rodríguez (mailto:alu0101014319@ull.edu.es)
#Copyright::   Cretive Commons
#License::     Distributes under the same terms as Ruby




#Se define la estructura que hará de nodo en la lista
Node = Struct.new(:value, :next, :prev)

class Lista
	
	#Se ha incluido el mixin Enumerable
	attr_accessor :node, :head, :tail	
	include Enumerable

	#Se asigna la cabeza y la cola de la lista
	def initialize(head, tail)
		@head = head
		@tail = tail
		@size = 0
	end

	#Inserta un nodo por la cabeza
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

	#Inserta un nodo por la cola
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

	#Extrae un nodo por la cabeza
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

	#Extrae un nodo por la cola
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

	#Devuelve el nodo que contiene la cabeza de la lista
	def get_head
		if @head.nil?
			raise "Lista vacía"
		else
			@head
		end
	end

	#Devuelve el nodo que contiene la cola de la lista
	def get_tail
		if @head.nil?
			raise "Lista vacía"
		else
			@tail
		end
	end

	#Devuelve el tamaño de la lista
	def get_size
		@size
	end

	#Inserta varios nodos de una vez y se quedan en la lista en el orden en el que llegaron
	def insert_group(v_nodes)
		v_nodes.each do |nodo|
			self.insert_tail(nodo)
		end
	end

	#Muestra la lista formateada
	def show_list
		lista = ""
		if @head.nil?
			raise "Lista vacía"
		else
			aux = @head
			while !aux.nil?
				lista << aux[:value].to_s + " "
				aux = aux[:next]
			end
		end
		lista
	end

	#Devuelve la cantidad de gases anuales que emiten todos los alimentos que contiene la lista
	def gases_anuales(gramos)
		gases = 0
		iterator = 0
		aux = @head
		while !aux.nil?
			gases += aux[:value].porcion_gases(gramos[iterator])
			aux = aux[:next]
			iterator += 1
		end
		gases.round(2)
	end

	#Devuelve la cantidad de terreno que usan todos los alimentos de la lista
	def terreno_anual(gramos)
		terreno = 0
		iterator = 0
		aux = @head
		while !aux.nil?
			terreno += aux[:value].porcion_terreno(gramos[iterator])
			aux = aux[:next]
			iterator += 1
		end
		terreno.round(2)
	end

	#Devuelve la cantidad de gases diarios que emiten todos los alimentos de la lista
	def gases_diarios(gramos)
		gases = gases_anuales(gramos)
		gases_d = (gases / 365).round(3)
		gases_d
	end
       	
	#Se incluye el método del mixin Enumerable
	#Se define como una iteración sobre la cabeza de la lista
	def each
		i = @head
                while !i.nil?
                        yield i[:value]
                        i = i[:next]
                end
        end
end
