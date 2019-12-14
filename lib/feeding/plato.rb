class Plato
	
	attr_reader :nombre, :alimentos, :gramos
	include Comparable

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
		aux_gr = @gramos.get_head()
		kcal = 0
		while !aux.nil?
			kcal  += (aux_gr[:value] / 100) * (aux[:value].proteina * 4 + aux[:value].carbohidratos * 4 + aux[:value].lipidos * 9).round(2)
			aux = aux[:next]
			aux_gr = aux_gr[:next]
		end
		kcal.round(2)
	end

	def to_s
		"(#{@nombre}, #{@alimentos.show_list}, (#{@gramos.show_list}))"
	end


	def <=>(other)
		get_kcal <=> other.get_kcal
	end

end

class Eficiencia < Plato

	include Comparable

	def initialize(nombre, alimentos, gramos)
		super(nombre, alimentos, gramos)
	end

	def get_nombre
		super
	end

	def get_alimentos
		super
	end

	def get_gramos
		super
	end

	def get_gasesD
		(get_gasesA / 365).round(3)
	end

	def get_gasesA
		aux_gases = @alimentos.get_head()
                aux_gr = @gramos.get_head()
                gases_t = 0
                while !aux_gases.nil?
                        gases_t += (aux_gases[:value].porcion_gases(aux_gr[:value]))
                        aux_gases = aux_gases[:next]
                        aux_gr = aux_gr[:next]
                end
                gases_t.round(2)
	end

	def get_terreno
		aux_terreno = @alimentos.get_head()
		aux_gr = @gramos.get_head()
                terreno_t = 0
                while !aux_terreno.nil?
                        terreno_t += (aux_terreno[:value].porcion_terreno(aux_gr[:value]))
                        aux_terreno = aux_terreno[:next]
                        aux_gr = aux_gr[:next]
                end
		terreno_t.round(2)

	end

	def to_s
		super + "(#{get_gasesA}, #{get_gasesD}, #{get_terreno})"

	end

	def hn
       		if (get_kcal < 670)
                        v_kcal = 1
                elsif (get_kcal > 830)
                        v_kcal = 3
                else
                        v_kcal = 2
                end

                if (get_gasesA < 0.8)
                        v_gases = 1
                elsif (get_gasesA > 1.2)
                    	v_gases = 3
                else
                        v_gases = 1
                end
		
		((v_kcal + v_gases)/2.0).round(2)
	end

	def <=>(other)
		hn <=> other.hn
	end	
end
