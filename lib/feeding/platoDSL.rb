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
		alimento << " (Gr: #{options[:gramos]} gr)" if options[:gramos]
		alimento << " (Pr: #{options[:proteinas]} gr)" if options[:proteinas]
		alimento << " (Hd: #{options[:hidratos]} gr)" if options[:hidratos]
		alimento << " (Lp: #{options[:lipidos]} gr)" if options[:lipidos]
		alimento << " (CO2: #{options[:gases]} kg/año)" if options[:gases]
		alimento << " (Terreno: #{options[:terreno]} m2/año)\n" if options[:terreno]
		@alimentos << alimento
	end

	def to_s
		salida = @nombre
		salida << "\n#{'=' * @nombre.size}\n\n"
		salida << "Alimentos: - #{@alimentos.join('- ')}\n\n"
	end
end
