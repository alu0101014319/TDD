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
                plato << " (Descripción: #{options[:descripcion]})" if options[:descripcion]
                plato << " (#{options[:precio]}€)\n" if options[:precio]
                @precio += options[:precio]
		@platos << plato
	end

	def descripcion(d)
		@descripcion = d
	end

	def to_s
		salida = @nombre
                salida << "\n#{'=' * @nombre.size}\n"
		salida << "Descripción: #{@descripcion}\n\n"
                salida << "Platos: - #{@platos.join('- ')}\n"
		salida << "Precio total: #{@precio}€\n\n"
	end
end
