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

	def plato(nombre, options = {})
		plato = nombre
                plato << " Descripción: #{options[:descripcion]}" if options[:descripcion]
                plato << " Precio: #{options[:precio]}€" if options[:precio]
                @precio += options[:precio]
		@platos << plato
	end
end
