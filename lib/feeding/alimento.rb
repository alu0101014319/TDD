class Alimento
	attr_reader :no, :pr, :ca, :li, :gei, :te 
	def initialize(no,pr,ca,li,gei,te)
		@no = no
		@pr = pr
		@ca = ca
		@li = li
		@gei = gei
		@te = te
	end

	def name
		@no
	end

	def proteina
		@pr
	end

	def carbohidratos
		@ca
	end

	def lipidos
		@li
	end

	def gases 
		@gei
	end

	def terreno
		@te
	end

	def formato
		"Nombre: #{@no} Proteínas: #{@pr} Carbohidratos: #{@ca} Lípidos: #{@li} GasesEI: #{@gei} Terreno: #{@te}"
	end

	def kcal 
		(@pr * 4 + @ca * 4 + @li * 9).round(2)
	end

end
