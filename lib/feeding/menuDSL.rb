class MenuDSL

	def initialize(nombre, &block)
		@nombre = nombre
		@descripcion = ""
		@platos = []
		@precio = 0

		if block_given?
		  	if block.arity == 1
			    	yield self
		  	else
			 	instance_eval(&block)
		  	end
	    	end
	end
end
