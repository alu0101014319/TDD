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

	def to_s
		"(#{@no}, #{@pr}, #{@ca}, #{@li}, #{@gei}, #{@te})"
	end

	def kcal 
		(@pr * 4 + @ca * 4 + @li * 9).round(2)
	end

	def impacto(gr, alimento1,a1gr, alimento2,a2gr, alimento3,a3gr, alimento4,a4gr)
		v_impacto = []

		v_impacto[0] = (porcion_gases(gr) + alimento1.porcion_gases(a1gr) + alimento2.porcion_gases(a2gr) + alimento3.porcion_gases(a3gr) + alimento4.porcion_gases(a4gr)).round(2)
		v_impacto[1] = (porcion_terreno(gr) + alimento1.porcion_terreno(a1gr) + alimento2.porcion_terreno(a2gr) + alimento3.porcion_terreno(a3gr) + alimento4.porcion_terreno(a4gr)).round(2)

		v_impacto.to_s
	end

	def porcion_gases(gramos)
		gases = ((gramos * @gei) / 1000).round(2)
	end

	def porcion_terreno(gramos)
		metros = ((gramos * @te) / 1000).round(2)
	end
end
