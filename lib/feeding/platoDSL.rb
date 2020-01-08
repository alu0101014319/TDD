class PlatoDSL

	def initialize(nombre, &block)
		@nombre = nombre
		@alimentos = []
		@gramos = []

		if block_given?
		  if block.arity == 1
			yield self
	    	  else
		   	  instance_eval(&block)
	    	  end
	    	end
	end

	def alimento(nombre, options = {})
		alimento = nombre
		alimento << " (#{options[:gramos]})" if options[:gramos]
		alimento << " (#{options[:proteinas]})" if options[:proteinas]
		alimento << " (#{options[:hidratos]})" if options[:hidratos]
		alimento << " (#{options[:lipidos]})" if options[:lipidos]
		alimento << " (#{options[:gases]})" if options[:gases]
		alimento << " (#{options[:terreno]})\n" if options[:terreno]
		@alimentos << alimento
	end

	def to_s
		salida = @nombre
		salida << "\n#{'=' * @nombre.size}\n\n"
		salida << "Alimentos: #{@alimentos.join(', ')}\n\n"
	end
end
