#encoding: utf-8
#Esta clase permite representar un alimento con sus propiedades nutricionales y su impacto ambiental por cada Kg del mismo.
#Cada alimento posee la cantidad de proteínas, lípidos, carbohidratos y kcalorías, además de la información del uso del terreno para producir el alimento o la emisión de gases anuales.

#Author::      Eduardo Estévez Rodríguez (mailto:alu0101014319@ull.edu.es)
#Copyright::   Cretive Commons
#License::     Distributes under the same terms as Ruby

class Alimento

	#Se ha incluido el mixin Comparable	
	attr_reader :no, :pr, :ca, :li, :gei, :te 
	include Comparable

	#Se asigna el nombre del alimento junto con su información nutricional e impacto ambiental
	def initialize(no,pr,ca,li,gei,te)
		@no = no
		@pr = pr
		@ca = ca
		@li = li
		@gei = gei
		@te = te
	end

	#Devuelve el nombre del alimento
	def name
		@no
	end

	#Devuelve la cantidad de proteínas que posee
	def proteina
		@pr
	end

	#Devuelve la cantidad de carbohidratos que posee
	def carbohidratos
		@ca
	end

	#Devuelve la cantidad de lipidos que posee
	def lipidos
		@li
	end

	#Devuelve la cantidad de gases que emite anualmente
	def gases 
		@gei
	end

	#Devuelve la cantidad de terreno que usa para su producción
	def terreno
		@te
	end

	#Devuelve el alimento formateado
	def to_s
		"(#{@no}, #{@pr}, #{@ca}, #{@li}, #{@gei}, #{@te})"
	end

	#Devuelve la cantidad de kcalorías que aporta
	def kcal 
		(@pr * 4 + @ca * 4 + @li * 9).round(2)
	end

	#Devuelve el impacto ambiental diario que genera la alimentación de una persona adulta
	def impacto(gr, alimento1,a1gr, alimento2,a2gr, alimento3,a3gr, alimento4,a4gr)
		v_impacto = []

		v_impacto[0] = (porcion_gases(gr) + alimento1.porcion_gases(a1gr) + alimento2.porcion_gases(a2gr) + alimento3.porcion_gases(a3gr) + alimento4.porcion_gases(a4gr)).round(2)
		v_impacto[1] = (porcion_terreno(gr) + alimento1.porcion_terreno(a1gr) + alimento2.porcion_terreno(a2gr) + alimento3.porcion_terreno(a3gr) + alimento4.porcion_terreno(a4gr)).round(2)

		v_impacto.to_s
	end

	#Calcula la cantidad de gases que emite cierta cantidad de gramos del alimento
	def porcion_gases(gramos)
		gases = ((gramos * @gei) / 1000).round(2)
	end

	#Calcula la cantidad de terreno que utiliza cierta cantidad de gramos del alimento para su producción
	def porcion_terreno(gramos)
		metros = ((gramos * @te) / 1000).round(2)
	end

	#Se define para incluir el mixin comparable tomando como valor para la comparación la cantidad de kcalorías que posee el alimento
	def <=>(other)
		kcal <=> other.kcal
	end
end
