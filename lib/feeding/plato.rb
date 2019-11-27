class Plato
	attr_reader :nombre, :alimentos, :gramos

	def initialize(nombre, alimentos, gramos)
		@nombre = nombre
		@alimentos = alimentos
		@gramos = gramos
	end
	
	def get_nombre
		@nombre
	end

	def get_alimentos
		@alimentos
	end

	def get_gramos
		@gramos
	end

	def get_prt
		aux_ali = @alimentos.get_head()
		aux_gr = @gramos.get_head()
		proteinas_t = 0
		gramos_t = 0
		while !aux_ali.nil?
			proteinas_t += (aux_ali[:value].proteina * aux_gr[:value]) / 100
			gramos_t += aux_gr[:value]
			aux_ali = aux_ali[:next]
			aux_gr = aux_gr[:next]
		end
		((proteinas_t / gramos_t) * 100).round(2)
	end

	def get_cbh
		aux_ali = @alimentos.get_head()
                aux_gr = @gramos.get_head()
                carbohi_t = 0
                gramos_t = 0
                while !aux_ali.nil?
                        carbohi_t += (aux_ali[:value].carbohidratos * aux_gr[:value]) / 100
                        gramos_t += aux_gr[:value]
                        aux_ali = aux_ali[:next]
                        aux_gr = aux_gr[:next]
                end
                ((carbohi_t / gramos_t) * 100).round(2)
        end

	def get_lpd
                aux_ali = @alimentos.get_head()
                aux_gr = @gramos.get_head()
                lipidos_t = 0
                gramos_t = 0
                while !aux_ali.nil?
                        lipidos_t += (aux_ali[:value].lipidos * aux_gr[:value]) / 100
                        gramos_t += aux_gr[:value]
                        aux_ali = aux_ali[:next]
                        aux_gr = aux_gr[:next]
                end
                ((lipidos_t / gramos_t) * 100).round(2)
        end

	def get_kcal
		aux = @alimentos.get_head()
		kcal = 0
		while !aux.nil?
			kcal  += (aux[:value].proteina * 4 + aux[:value].carbohidratos * 4 + aux[:value].lipidos * 9).round(2)
			aux = aux[:next]
		end
		kcal.round(2)
	end

	def to_s
		"(#{@nombre}, #{@alimentos.show_list}, (#{@gramos.show_list}))"
	end
end
