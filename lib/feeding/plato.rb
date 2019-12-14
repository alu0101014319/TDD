#encoding: utf-8
#Esta clase representa un plato formado por diferentes alimentos. Dicho plato solo posee la información nutricional del mismo, es decir, los alimentos y la cantidad de los que está formado, y la cantidad de proteínas, así como de lípidos o la cantidad de kcal que posee, entre otros.

#Author::      Eduardo Estévez Rodríguez (mailto:alu0101014319@ull.edu.es)
#Copyright::   Cretive Commons
#License::     Distributes under the same terms as Ruby

class Plato
	
	#Se incluye el mixin Comparable
	attr_reader :nombre, :alimentos, :gramos
	include Comparable

	#Se asigna el nombre del plato, los alimentos y la cantidad de cada alimento en gramos
	def initialize(nombre, alimentos, gramos)
		@nombre = nombre
		@alimentos = alimentos
		@gramos = gramos
	end
	
	#Devuelve el nombre del plato
	def get_nombre
		@nombre
	end

	#Devuelve el conjunto de alimentos que forman el plato
	def get_alimentos
		@alimentos
	end

	#Devuelve el conjunto de gramos que forman los alimentos del plato
	def get_gramos
		@gramos
	end

	#Devuelve la cantidad de proteínas que posee el plato
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

	#Devuelve la cantidad de carbohidratos que posee el plato
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

	#Devuelve la cantidad de lípidos que posee el plato
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

	#Devuelve la cantidad de kcalorías que posee el plato
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

	#Devuelve el plato formateado
	def to_s
		"(#{@nombre}, #{@alimentos.show_list}, (#{@gramos.show_list}))"
	end

	#Se define para incluir el mixin Comparable
	#Se toma como valor para la comparación las kcalorías del plato
	def <=>(other)
		get_kcal <=> other.get_kcal
	end

end


#encoding: utf-8
#Esta clase representa un plato formado por diferentes alimentos. Dicho plato hereda la información nutricional de su clase padre Plato, y además posee la información respectiva al impacto ambiental de dicho plato, es decir, la emisión de gases anuales, diarios y el uso del terreno que conlleva su producción.

#Author::      Eduardo Estévez Rodríguez (mailto:alu0101014319@ull.edu.es)
#Copyright::   Cretive Commons
#License::     Distributes under the same terms as Ruby
class Eficiencia < Plato

	#Se incluye el mixin Comparable
	include Comparable

	#Se asigna el nombre del plato, los alimentos y la cantidad en gramos que los mismos. Función heredada
	def initialize(nombre, alimentos, gramos)
		super(nombre, alimentos, gramos)
	end

	#Devuelve el nombre del plato. Función heredada
	def get_nombre
		super
	end

	#Devuelve los alimentos que componen el plato. Función heredada
	def get_alimentos
		super
	end

	#Devuelve los gramos de los alimentos que componen el plato. Función heredada
	def get_gramos
		super
	end

	#Devuelve la cantidad de gases diarios emitidos al producir el plato
	def get_gasesD
		(get_gasesA / 365).round(3)
	end

	#Devuelve la cantidad de gases anuales emitidos al producir el plato
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

	#Devuelve la cantidad de terreno que utiliza al producir el plato
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

	#Devuelve el plato formateado con la informacón nutricional y ambiental
	def to_s
		super + "(#{get_gasesA}, #{get_gasesD}, #{get_terreno})"

	end

	#Calcula la huella nutricional del plato
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

	#Se define para incluir el mixin Comparable
	#Se toma como valor para la comparación la huella nutricional del plato
	def <=>(other)
		hn <=> other.hn
	end	
end
