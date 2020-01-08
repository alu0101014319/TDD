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
		@alimentos << alimento
	end
end
