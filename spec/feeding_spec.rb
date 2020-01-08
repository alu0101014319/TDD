RSpec.describe Alimento do
       before (:all)	do
                @carne_vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		@carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
		@camarones = Alimento.new("Camarones", 17.6,1.5,0.6,18.0,2.0)
		@salmon = Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
		@lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
        end

       it "Obtener el nombre" do
	       expect(@carne_vaca.name).to eq("Carne de vaca")
	       expect(@carne_cordero.name).to eq("Carne de cordero")
	       expect(@camarones.name).to eq("Camarones")
	       expect(@salmon.name).to eq("Salmón")
	       expect(@lentejas.name).to eq("Lentejas")
       end

       it "Obtener gramos de proteína" do
	       expect(@carne_vaca.proteina).to eq(21.1)
	       expect(@carne_cordero.proteina).to eq(18.0)
	       expect(@camarones.proteina).to eq(17.6)
	       expect(@salmon.proteina).to eq(19.9)
	       expect(@lentejas.proteina).to eq(23.5)
       end

       it "Obtener gramos de carbohidratos" do
	       expect(@carne_vaca.carbohidratos).to eq(0.0)
               expect(@carne_cordero.carbohidratos).to eq(0.0)
               expect(@camarones.carbohidratos).to eq(1.5)
	       expect(@salmon.carbohidratos).to eq(0.0)
	       expect(@lentejas.carbohidratos).to eq(52.0)
       end

       it "Obtener gramos de lípidos" do
	       expect(@carne_vaca.lipidos).to eq(3.1)
               expect(@carne_cordero.lipidos).to eq(17.0)
	       expect(@camarones.lipidos).to eq(0.6)
	       expect(@salmon.lipidos).to eq(13.6)
	       expect(@lentejas.lipidos).to eq(1.4)
       end

       it "Obtener kilos de gases de efecto invernadero" do
	       expect(@carne_vaca.gases).to eq(50.0)
	       expect(@carne_cordero.gases).to eq(20.0)
	       expect(@camarones.gases).to eq(18.0)
	       expect(@salmon.gases).to eq(6.0)
               expect(@lentejas.gases).to eq(0.4)
       end

       it "Obtener uso del terreno anual en m²" do
	       expect(@carne_vaca.terreno).to eq(164.0)
               expect(@carne_cordero.terreno).to eq(185.0)
               expect(@camarones.terreno).to eq(2.0)
	       expect(@salmon.terreno).to eq(3.7)
	       expect(@lentejas.terreno).to eq(3.4)
       end

       it "Obtener el alimento formateado" do
               expect(@carne_vaca.to_s).to eq("(#{@carne_vaca.name}, #{@carne_vaca.proteina}, #{@carne_vaca.carbohidratos}, #{@carne_vaca.lipidos}, #{@carne_vaca.gases}, #{@carne_vaca.terreno})")

               expect(@carne_cordero.to_s).to eq("(#{@carne_cordero.name}, #{@carne_cordero.proteina}, #{@carne_cordero.carbohidratos}, #{@carne_cordero.lipidos}, #{@carne_cordero.gases}, #{@carne_cordero.terreno})")

               expect(@camarones.to_s).to eq("(#{@camarones.name}, #{@camarones.proteina}, #{@camarones.carbohidratos}, #{@camarones.lipidos}, #{@camarones.gases}, #{@camarones.terreno})")
	       
               expect(@salmon.to_s).to eq("(#{@salmon.name}, #{@salmon.proteina}, #{@salmon.carbohidratos}, #{@salmon.lipidos}, #{@salmon.gases}, #{@salmon.terreno})")

               expect(@lentejas.to_s).to eq("(#{@lentejas.name}, #{@lentejas.proteina}, #{@lentejas.carbohidratos}, #{@lentejas.lipidos}, #{@lentejas.gases}, #{@lentejas.terreno})")
       end

       it "Obtener las kcal del alimento" do
	       expect(@carne_vaca.kcal).to eq(112.3)
               expect(@carne_cordero.kcal).to eq(225)
	       expect(@camarones.kcal).to eq(81.8)
               expect(@salmon.kcal).to eq(202)
	       expect(@lentejas.kcal).to eq(314.6)
       end

       context "Calcular el impacto ambiental de la dieta recomendada para un varón adulto (54gr proteína)" do
	       it "Obtener impacto ambiental de la dieta" do
		       @carne_de_vaca = Alimento.new("Carne de vaca",10.0,0.0,1.47,50.0,164.0) #47.4 gr
		       @carne_de_cordero = Alimento.new("Carne de cordero",10.0,0.0,9.44,20.0,185.0) #55.6 gr
		       @lentejas_ = Alimento.new("Lentejas",10.0,22.13,0.6,0.4,3.4) #42.6 gr
		       @tofu = Alimento.new("Tofu",10.0,2.38,6.0,2.0,2.2) #125 gr
		       @nuez = Alimento.new("Nuez",14.0,14.7,37.8,0.3,7.9) #70 gr

		       expect(@carne_de_vaca.impacto(47.4,@carne_de_cordero,55.6, @lentejas,42.6, @tofu,125, @nuez,70).to_s).to eq("[3.77, 19.03]")

	       end
       end

       context "Calcular el impacto ambiental de la dieta recomendada para una mujer adulta (47 gr proteína)" do
	       it "Obtener el impacto ambiental de la nueva dieta" do
		       @carne_de_vaca = Alimento.new("Carne de vaca",10.0,0.0,1.47,50.0,164.0) #47.4 gr
                       @carne_de_cordero = Alimento.new("Carne de cordero",10.0,0.0,9.44,20.0,185.0) #55.6 gr
                       @lentejas_ = Alimento.new("Lentejas",10.0,22.13,0.6,0.4,3.4) #42.6 gr
                       @tofu = Alimento.new("Tofu",10.0,2.38,6.0,2.0,2.2) #125 gr
		       @nuez = Alimento.new("Nuez",7.0,7.35,18.9,0.3,7.9) #35 gr

		       expect(@carne_de_vaca.impacto(47.4,@carne_de_cordero,55.6, @lentejas,42.6, @tofu,125, @nuez,35).to_s).to eq("[3.76, 18.76]")

	       end
       end
end

RSpec.describe Lista do
	 before(:all) do

 		 @lentejas_esp = Alimento.new("Lentejas", 70.5, 156.0, 4.2, 0.4, 3.4)#300gr
		 @nueces_esp = Alimento.new("Nueces", 40.0, 42.0, 108.0, 0.3, 7.9)#200g
		 @leche_esp = Alimento.new("Leche", 9.9, 14.4, 9.6, 3.2, 8.9)#300gr
		 @chocolate_esp = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)#100gr
		 @camarones_esp = Alimento.new("Camarones", 35.2, 3.0, 1.2, 18.0, 2.0)#200gr
		 @gramos_esp = [300,200,300,100,200]
		 @española = Lista.new(nil, nil)
		 @española.insert_group([@lentejas_esp, @nueces_esp, @leche_esp, @chocolate_esp, @camarones_esp])

		 @lentejas_vas = Alimento.new("Lentejas", 70.5, 156.0, 4.2, 0.4, 3.4)#300gr
		 @chocolate_vas = Alimento.new("Chocolate", 10.6, 96.0, 60.0, 2.3, 3.4)#200gr
		 @tofu_vas = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)#1000gr
		 @cerveza_vas = Alimento.new("Cerveza", 1.5, 10.8, 0.0, 0.24, 0.22)#300gr
		 @leche_vas = Alimento.new("Leche", 6.6, 9.6, 6.4, 3.2, 8.9)#200gr
		 @gramos_vas = [300,200,100,300,200]
		 @vasca = Lista.new(nil, nil)
		 @vasca.insert_group([@lentejas_vas, @chocolate_vas, @tofu_vas, @cerveza_vas, @leche_vas])

		 @leche_vgr = Alimento.new("Leche",128.0, 185.76, 123.8, 3.2, 8.9)#3870gr
		 @huevos_vgr = Alimento.new("Huevos", 22.0, 1.87, 18.7, 4.2, 5.7)#170gr
		 @lentejas_vgr = Alimento.new("Lentejas", 47.0, 104.0, 2.8, 0.4, 3.4)#200gr
		 @gramos_vgr = [3870, 170, 200]
		 @vegetaria = Lista.new(nil, nil)
		 @vegetaria.insert_group([@leche_vgr, @huevos_vgr, @lentejas_vgr])

		 @lentejas_vgl = Alimento.new("Lentejas", 117.5, 260.0, 7.0, 0.4, 3.4)#500gr
		 @nueces_vgl = Alimento.new("Nueces", 20.0, 21.0, 54.0, 0.3, 7.9)#100gr
		 @tofu_vgl = Alimento.new("Tofu", 16.0, 3.8, 9.6, 2.0, 2.2)#200gr
		 @gramos_vgl = [500,100,200]
		 @vegetalia = Lista.new(nil, nil)
		 @vegetalia.insert_group([@lentejas_vgl, @nueces_vgl, @tofu_vgl])

		 @vaca_car = Alimento.new("Carne vaca", 105.5, 0.0, 15.5, 50.0, 164.0)#500gr
		 @cerdo_car = Alimento.new("Carne cerdo", 107.5, 0.0, 31.5, 7.6, 11.0)#500gr
		 @pollo_car = Alimento.new("Carne pollo", 103.0, 0.0, 28.0, 5.7, 7.1)#500gr
		 @lentejas_car = Alimento.new("Lentejas", 70.5, 156.0, 4.2, 0.4, 3.4)#300gr
		 @gramos_car = [500,500,500,300]
		 @carnivora = Lista.new(nil, nil)
		 @carnivora.insert_group([@vaca_car, @cerdo_car, @pollo_car, @lentejas_car])
	 end



	context "Probando funcionamiento de la lista doblemente enlazada" do
		
		before(:each) do
			@lista = Lista.new(nil, nil)
			@carne_vaca = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		end

		it "Generar nodo con struct" do
			@nodo = Node.new("Carne", nil, nil)
			expect(@nodo[:value]).to eq("Carne")
		end

		it "Inicializar lista" do
			expect(@lista.head).to be_nil()
		end

		it "Insertar por la cabeza" do
			@lista.insert_head(@carne_vaca)
			expect(@lista.head[:value].name).to eq("Carne de vaca")
		end

		it "Insertar por la cola" do
                        @lista.insert_tail(@carne_vaca)
                        expect(@lista.tail[:value].name).to eq("Carne de vaca")
		end

		it "Extraer por la cabeza" do
                        @lista.insert_head(@carne_vaca)
			@lista.extract_head()
			expect(@lista.head).to be_nil()
		end

		it "Extraer por la cola" do
			@lista.insert_tail(@carne_vaca)
			@lista.extract_tail()
                        expect(@lista.tail).to be_nil()
		end

		it "Obtener la cabeza" do
			@lista.insert_head(@carne_vaca)
			aux = @lista.get_head()
			expect(aux[:value].name).to eq("Carne de vaca")
		end

		it "Obtener la cola" do
			@lista.insert_tail(@carne_vaca)
                        aux = @lista.get_tail()
                        expect(aux[:value].name).to eq("Carne de vaca")
                end

		it "Obtener la tamaño" do
                        @lista.insert_head(@carne_vaca)
			expect(@lista.get_size()).to eq(1)
                end

		it "Insertar grupo de alimentos" do
			@carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
			@camarones = Alimento.new("Camarones", 17.6,1.5,0.6,18.0,2.0)
			@salmon = Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
			@lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
			
			@lista.insert_group([@carne_vaca, @carne_cordero, @camarones, @salmon, @lentejas])

			expect(@lista.get_size()).to eq(5)
		end

		it "Mostrar lista" do
			@carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
			@camarones = Alimento.new("Camarones", 17.6,1.5,0.6,18.0,2.0)

                        @lista.insert_group([@carne_vaca, @carne_cordero, @camarones])
			expect(@lista.show_list()).to eq("(Carne de vaca, 21.1, 0.0, 3.1, 50.0, 164.0) (Carne de cordero, 18.0, 0.0, 17.0, 20.0, 185.0) (Camarones, 17.6, 1.5, 0.6, 18.0, 2.0) ")

		end
	end			

	context "Dieta Española para hombre" do
		it "Calcular los gases anuales" do
			expect(@española.gases_anuales(@gramos_esp)).to eq(4.97)
		end

		it "Calcular el uso de terreno anual" do
			expect(@española.terreno_anual(@gramos_esp)).to eq(6.01)
		end

		it "Calcular los gases diarios" do
			expect(@española.gases_diarios(@gramos_esp)).to eq(0.014)
		end
	end

	context "Dieta Vasca para mujer" do
                it "Calcular los gases anuales" do
			expect(@vasca.gases_anuales(@gramos_vas)).to eq(1.49)
                end

		it "Calcular el uso de terreno anual" do
			expect(@vasca.terreno_anual(@gramos_vas)).to eq(3.77)
                end

   		it "Calcular los gases diarios" do
                        expect(@vasca.gases_diarios(@gramos_vas)).to eq(0.004)
                end

        end
	
	context "Dieta Vegetaria para hombre" do
                it "Calcular los gases anuales" do
			expect(@vegetaria.gases_anuales(@gramos_vgr)).to eq(13.17)
                end

		it "Calcular el uso de terreno anual" do
			expect(@vegetaria.terreno_anual(@gramos_vgr)).to eq(36.09)
   		end
   
		it "Calcular los gases diarios" do
                        expect(@vegetaria.gases_diarios(@gramos_vgr)).to eq(0.036)
                end
        end
	
	context "Dieta Vegetalia para mujer" do
                it "Calcular los gases anuales" do
			expect(@vegetalia.gases_anuales(@gramos_vgl)).to eq(0.63)
                end

		it "Calcular el uso de terreno anual" do
			expect(@vegetalia.terreno_anual(@gramos_vgl)).to eq(2.93)
                end
                
		it "Calcular los gases diarios" do
                        expect(@vegetalia.gases_diarios(@gramos_vgl)).to eq(0.002)
                end
        end
	
	context "Dieta Carnívora para hombre" do           
		it "Calcular los gases anuales" do
			expect(@carnivora.gases_anuales(@gramos_car)).to eq(31.77)
                end

		it "Calcular el uso de terreno anual" do
			expect(@carnivora.terreno_anual(@gramos_car)).to eq(92.07)
                end

		it "Calcular los gases diarios" do
                        expect(@carnivora.gases_diarios(@gramos_car)).to eq(0.087)
                end

        end

	context "Comparar kcal de alimentos con Comparable" do
               before(:each) do
		       @carne_vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		       @lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
	       end

	       it "Operador <" do
                       expect(@carne_vaca < @lentejas).to eq(true)
               end

	       it "Operador >" do
		       expect(@carne_vaca > @lentejas).to eq(false)
	       end

	       it "Operador ==" do
                       expect(@carne_vaca == @lentejas).to eq(false)
               end
               
	       it "Operador <=" do
                       expect(@carne_vaca <= @lentejas).to eq(true)
	       end

	       it "Operador >=" do
                       expect(@carne_vaca >= @lentejas).to eq(false)
               end
              
	       it "Operador !=" do
                       expect(@carne_vaca != @lentejas).to eq(true)
               end

	       it "Operador between?" do
		       @carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
		       expect(@carne_cordero.between?(@carne_vaca, @lentejas)).to eq(true)
	       end
 	end

	context "Enumerar listas de alimentos con Enumerable" do
		before(:each) do
                       @carne_vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
                       @lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
		       @enumerable = Lista.new(nil,nil)
		       @enumerable.insert_group([@carne_vaca, @lentejas])
		end

		it "Obtener alimento con menos kcal" do
			expect(@enumerable.min).to eq(@carne_vaca)
		end

                it "Obtener alimento con más kcal" do
                        expect(@enumerable.max).to eq(@lentejas)
                end
		
		it "Ordenar lista por cantidad de kcal" do
			expect(@enumerable.sort).to eq([@carne_vaca, @lentejas])
		end	
		
		it "Collect. Restar 10 unidades a las kcal" do
			expect(@enumerable.collect{ |x| x.kcal - 10}).to eq([102.3, 304.6])
		end

		it "Select. Seleccionar alimentos con kcal pares" do
			expect(@enumerable.select{ |x| x.kcal.to_i.even?}).to eq([@carne_vaca, @lentejas])
		end

		it "Detect. Detectar alimento con proteína impar y uso del terreno par" do
                        expect(@enumerable.detect{ |x| x.proteina.to_i.odd? && x.terreno.to_i.even?}).to eq(@carne_vaca)
		end			
	end
end



##############################################################################################################
RSpec.describe Plato do
	context "Información del plato" do
		before (:all) do
			@carne_vaca = Alimento.new("Carne", 21.1, 0.0, 3.1, 50.0, 164.0)
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
                        @alimentos = Lista.new(nil, nil)
                        @alimentos.insert_group([@carne_vaca, @lentejas])
                        @gramos = Lista.new(nil, nil)
                        @gramos.insert_group([100, 100])
                        @plato = Plato.new("Carne y lentejas", @alimentos, @gramos)
		end

		it "Instanciar un objeto plato" do
			@plato_ejemplo = Plato.new("Carne y lentejas", @alimentos, @gramos)
		end

		it "Obtener nombre del plato" do
			expect(@plato.get_nombre()).to eq("Carne y lentejas")
		end

		it "Obtener porcentaje de proteínas" do
			expect(@plato.get_prt()).to eq(22.3)
		end

		it "Obtener porcentaje de carbohidratos" do
                        expect(@plato.get_cbh()).to eq(26)			
		end

		it "Obtener porcentaje de lípidos" do 
                        expect(@plato.get_lpd()).to eq(2.25)
		end

		it "Obtener número de kcal del plato" do
			expect(@plato.get_kcal()).to eq(426.9)
		end

		it "Obtener el plato formateado" do
			expect(@plato.to_s()).to eq("(Carne y lentejas, (Carne, 21.1, 0.0, 3.1, 50.0, 164.0) (Lentejas, 23.5, 52.0, 1.4, 0.4, 3.4) , (100 100 ))")
		end
	end

	context "Jerarquía de clases. Clase Eficiencia energética" do
		before (:all) do
			@carne_vaca = Alimento.new("Carne", 21.1, 0.0, 3.1, 50.0, 164.0)
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
                        @alimentos = Lista.new(nil, nil)
                        @alimentos.insert_group([@carne_vaca, @lentejas])
                        @gramos = Lista.new(nil, nil)
                        @gramos.insert_group([100, 100])
                        @eficiencia = Eficiencia.new("Carne y lentejas", @alimentos, @gramos)
		end

		it "Instanciar un objeto Eficiencia" do
			@eficiencia_ejemplo = Eficiencia.new("Carne y lentejas", @alimentos, @gramos)
		end

		it "Obtener cantidad de gases anuales generados" do
			expect(@eficiencia.get_gasesA()).to eq(5.04)
		end

		it "Obtener cantidad de gases diarios generados" do
			expect(@eficiencia.get_gasesD()).to eq(0.014)
		end

		it "Obtener uso del terreno anual" do
			expect(@eficiencia.get_terreno()).to eq(16.74)
		end

		it "Eficiencia del plato formateada" do
			expect(@eficiencia.to_s).to eq("(Carne y lentejas, (Carne, 21.1, 0.0, 3.1, 50.0, 164.0) (Lentejas, 23.5, 52.0, 1.4, 0.4, 3.4) , (100 100 ))(5.04, 0.014, 16.74)")
		end
				
	end

	context "Pruebas de instancias/pertenencias de clase" do
		before (:all) do
                        @carne_vaca = Alimento.new("Carne", 21.1, 0.0, 3.1, 50.0, 164.0)
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
                        @alimentos = Lista.new(nil, nil)
                        @alimentos.insert_group([@carne_vaca, @lentejas])
                        @gramos = Lista.new(nil, nil)
                        @gramos.insert_group([100, 100])
                        @eficiencia = Eficiencia.new("Carne y lentejas", @alimentos, @gramos)
		end
		
		it "Clase de un objeto" do
			expect(@eficiencia.class == Eficiencia).to eq(true)
		end

		it "Instancia de una clase" do
			expect(@eficiencia.instance_of? Eficiencia).to eq(true)
                        expect(@eficiencia.instance_of? Plato).to eq(false)
		end

		it "Objeto de una clase" do
			expect(@eficiencia.is_a? BasicObject).to eq(true)
			expect(@eficiencia.is_a? Object).to eq(true)
		end

		it "Objeto tipo de una clase" do
			expect(@eficiencia.kind_of? Plato).to eq(true)
		end
	end

	context "Comparar platos de la dieta Española" do
		before (:all) do
			@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#300gr
			@nueces = Alimento.new("Nueces", 20.0, 21.0, 54.0, 0.3, 7.9)#200g
			@leche = Alimento.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9)#300gr
		     	@chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)#100gr
			@camarones = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)#200gr
			@alimentosLC = Lista.new(nil,nil)
                        @alimentosLC.insert_group([@lentejas, @camarones])
                        @gramosLC = Lista.new(nil,nil)
                        @gramosLC.insert_group([300, 200])

			@platoLC = Plato.new("Lentejas y camarones", @alimentosLC, @gramosLC)
			@eficienciaLC = Eficiencia.new("Lentejas y camarones", @alimentosLC, @gramosLC)
			
			@alimentosNLC = Lista.new(nil,nil)
                        @alimentosNLC.insert_group([@nueces, @leche, @chocolate])
                        @gramosNLC = Lista.new(nil,nil)
                        @gramosNLC.insert_group([200, 300, 100])

			@platoNLC = Plato.new("Postre de chocolate y nueces", @alimentosNLC, @gramosNLC)
			@eficienciaNLC = Eficiencia.new("Postre de chocolate y nueces", @alimentosNLC, @gramosNLC)
		end

		it "Comparación de valor nutricional y eficiencia" do
#			expect(@platoNLC > @platoLC).to eq(true)
# 			expect(@platoNLC < @platoLC).to eq(false)
# 			expect(@platoNLC == @platoNLC).to eq(true)
# 			expect(@platoNLC != @platoLC).to eq(true)
			
#			expect(@eficienciaNLC > @eficienciaLC).to eq(false)
#                        expect(@eficienciaNLC < @eficienciaLC).to eq(true)
#                        expect(@eficienciaNLC == @eficienciaNLC).to eq(true)
#                        expect(@eficienciaNLC != @eficienciaLC).to eq(true)
		end

		it "Enumerar dieta Española" do
			@dieta_española = Lista.new(nil, nil)
			@dieta_española.insert_group([@platoNLC, @platoLC])
			expect(@dieta_española.min).to eq(@platoLC)
			expect(@dieta_española.max).to eq(@platoNLC)
			expect(@dieta_española.sort).to eq([@platoLC, @platoNLC])
			expect(@dieta_española.collect{|x| x.get_kcal + 10}).to eq([1972.8, 1117.4])
			expect(@dieta_española.select{|x| x.get_kcal.to_i.even?}).to eq([@platoNLC])

			@ef_española = Lista.new(nil, nil)
                        @ef_española.insert_group([@eficienciaNLC, @eficienciaLC])
                        expect(@ef_española.min).to eq(@eficienciaNLC)
                        expect(@ef_española.max).to eq(@eficienciaLC)
                        expect(@ef_española.sort).to eq([@eficienciaNLC, @eficienciaLC])
                        expect(@ef_española.collect{|x| x.get_kcal + 10}).to eq([1972.8, 1117.4])
                        expect(@ef_española.select{|x| x.get_kcal.to_i.even?}).to eq([@eficienciaNLC])

		end
	end

	context "Comparar platos de la dieta Vasca" do
		before (:all) do
			@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#300gr
			@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)#100gr
			@cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)#200gr
                        @leche = Alimento.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9)#300gr
                        @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)#200gr

                        @alimentosLC = Lista.new(nil,nil)
                        @alimentosLC.insert_group([@leche, @chocolate])
                        @gramosLC = Lista.new(nil,nil)
                        @gramosLC.insert_group([300, 200])

                        @platoLC = Plato.new("Lecha chocolatada", @alimentosLC, @gramosLC)
                        @eficienciaLC = Eficiencia.new("Leche chocolatada", @alimentosLC, @gramosLC)

                        @alimentosTLC = Lista.new(nil,nil)
                        @alimentosTLC.insert_group([@tofu, @lentejas, @cerveza])
                        @gramosTLC = Lista.new(nil,nil)
                        @gramosTLC.insert_group([100, 300, 200])

                        @platoTLC = Plato.new("Tofu, Lentejas y cerveza", @alimentosTLC, @gramosTLC)
                        @eficienciaTLC = Eficiencia.new("Tofu, Lentejas y cerveza", @alimentosTLC, @gramosTLC)
		end

		it "Comparación del valor nutricional y eficiencia" do
		        expect(@platoTLC > @platoLC).to eq(false)
                        expect(@platoTLC < @platoLC).to eq(true)
                        expect(@platoTLC == @platoTLC).to eq(true)
                        expect(@platoTLC != @platoLC).to eq(true)

                        expect(@eficienciaTLC > @eficienciaLC).to eq(false)
                        expect(@eficienciaTLC < @eficienciaLC).to eq(true)
                        expect(@eficienciaTLC == @eficienciaTLC).to eq(true)
                        expect(@eficienciaTLC != @eficienciaLC).to eq(true)

		end

     		it "Enumerar dieta Vasca" do
                        @dieta_vasca = Lista.new(nil, nil)
                        @dieta_vasca.insert_group([@platoTLC, @platoLC])
                        expect(@dieta_vasca.min).to eq(@platoTLC)
                        expect(@dieta_vasca.max).to eq(@platoLC)
                        expect(@dieta_vasca.sort).to eq([@platoTLC, @platoLC])
			expect(@dieta_vasca.collect{|x| x.get_kcal + 10}).to eq([1069.4, 1152.0])
                        expect(@dieta_vasca.select{|x| x.get_kcal.to_i.even?}).to eq([@platoLC])

                        @ef_vasca = Lista.new(nil, nil)
                        @ef_vasca.insert_group([@eficienciaTLC, @eficienciaLC])
                        expect(@ef_vasca.min).to eq(@eficienciaTLC)
                        expect(@ef_vasca.max).to eq(@eficienciaLC)
                        expect(@ef_vasca.sort).to eq([@eficienciaTLC, @eficienciaLC])
			expect(@ef_vasca.collect{|x| x.get_kcal + 10}).to eq([1069.4, 1152.0])
                        expect(@ef_vasca.select{|x| x.get_kcal.to_i.even?}).to eq([@eficienciaLC])

                end
	end

	context "Comparar platos de la dieta Vegetariana" do
                before (:all) do
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#200gr
                        @leche = Alimento.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9)#3870gr
			@huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)#170gr
				
                        @alimentosL = Lista.new(nil,nil)
                        @alimentosL.insert_group([@leche])
                        @gramosL = Lista.new(nil,nil)
                        @gramosL.insert_group([3870])

                        @platoL = Plato.new("Leche", @alimentosL, @gramosL)
                        @eficienciaL = Eficiencia.new("Leche", @alimentosL, @gramosL)

                        @alimentosLH = Lista.new(nil,nil)
                        @alimentosLH.insert_group([@huevos, @lentejas])
                        @gramosLH = Lista.new(nil,nil)
                        @gramosLH.insert_group([170, 200])

                        @platoLH = Plato.new("Tofu, Lentejas y cerveza", @alimentosLH, @gramosLH)
                        @eficienciaLH = Eficiencia.new("Tofu, Lentejas y cerveza", @alimentosLH, @gramosLH)
                end

   		it "Comparación del valor nutricional y eficiencia" do
                        expect(@platoL > @platoLH).to eq(true)
                        expect(@platoL < @platoLH).to eq(false)
                        expect(@platoLH == @platoLH).to eq(true)
                        expect(@platoL != @platoLH).to eq(true)

                        expect(@eficienciaL > @eficienciaLH).to eq(true)
                        expect(@eficienciaL < @eficienciaLH).to eq(false)
                        expect(@eficienciaLH == @eficienciaLH).to eq(true)
                        expect(@eficienciaL != @eficienciaLH).to eq(true)

                end

		it "Enumerar dieta Vegetariana" do
                        @dieta_vgt = Lista.new(nil, nil)
                        @dieta_vgt.insert_group([@platoLH, @platoL])
                        expect(@dieta_vgt.min).to eq(@platoLH)
                        expect(@dieta_vgt.max).to eq(@platoL)
                        expect(@dieta_vgt.sort).to eq([@platoLH, @platoL])
			expect(@dieta_vgt.collect{|x| x.get_kcal + 10}).to eq([794.6, 2335.6])
                        expect(@dieta_vgt.select{|x| x.get_kcal.to_i.even?}).to eq([@platoLH])

                        @ef_vgt = Lista.new(nil, nil)
                        @ef_vgt.insert_group([@eficienciaLH, @eficienciaL])
                        expect(@ef_vgt.min).to eq(@eficienciaLH)
                        expect(@ef_vgt.max).to eq(@eficienciaL)
                        expect(@ef_vgt.sort).to eq([@eficienciaLH, @eficienciaL])
			expect(@ef_vgt.collect{|x| x.get_kcal + 10}).to eq([794.6, 2335.6])
                        expect(@ef_vgt.select{|x| x.get_kcal.to_i.even?}).to eq([@eficienciaLH])

                end

	end

	context "Comparar platos de la dieta Vegetaliana" do
                before (:all) do
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#500gr
			@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)#200gr
			@nueces = Alimento.new("Nueces", 20.0, 21.0, 54.0, 0.3, 7.9)#100g

                        @alimentosL = Lista.new(nil,nil)
                        @alimentosL.insert_group([@lentejas])
                        @gramosL = Lista.new(nil,nil)
                        @gramosL.insert_group([500])

                        @platoL = Plato.new("Lentejas", @alimentosL, @gramosL)
                        @eficienciaL = Eficiencia.new("Lentejas", @alimentosL, @gramosL)

                        @alimentosTN = Lista.new(nil,nil)
                        @alimentosTN.insert_group([@tofu, @nueces])
                        @gramosTN = Lista.new(nil,nil)
                        @gramosTN.insert_group([200, 100])

                        @platoTN = Plato.new("Tofu y nueces", @alimentosTN, @gramosTN)
                        @eficienciaTN = Eficiencia.new("Tofu y nueces", @alimentosTN, @gramosTN)
                end
		
   		it "Comparación del valor nutricional y eficiencia" do
#                        expect(@platoL > @platoTN).to eq(true)
#                        expect(@platoL < @platoTN).to eq(false)
#                        expect(@platoTN == @platoTN).to eq(true)
#                        expect(@platoL != @platoTN).to eq(true)

#                        expect(@eficienciaL >= @eficienciaTN).to eq(true)
#                        expect(@eficienciaL <= @eficienciaTN).to eq(true)
#                        expect(@eficienciaTN == @eficienciaTN).to eq(true)
#                        expect(@eficienciaL != @eficienciaTN).to eq(false)


                end
   
		it "Enumerar dieta Vegetaliana" do
                        @dieta_vgl = Lista.new(nil, nil)
                        @dieta_vgl.insert_group([@platoTN, @platoL])
                        expect(@dieta_vgl.min).to eq(@platoTN)
                        expect(@dieta_vgl.max).to eq(@platoL)
                        expect(@dieta_vgl.sort).to eq([@platoTN, @platoL])
			expect(@dieta_vgl.collect{|x| x.get_kcal + 10}).to eq([825.6, 1583.0])
                        expect(@dieta_vgl.select{|x| x.get_kcal.to_i.even?}).to eq([])

                        @ef_vgl = Lista.new(nil, nil)
                        @ef_vgl.insert_group([@eficienciaTN, @eficienciaL])
                        expect(@ef_vgl.min).to eq(@eficienciaTN)
                        expect(@ef_vgl.max).to eq(@eficienciaL)
                        expect(@ef_vgl.sort).to eq([@eficienciaTN, @eficienciaL])
			expect(@ef_vgl.collect{|x| x.get_kcal + 10}).to eq([825.6, 1583.0])
                        expect(@ef_vgl.select{|x| x.get_kcal.to_i.even?}).to eq([])

                end
	end

	context "Comparar platos de la dieta Carnívora" do
                before (:all) do
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#300gr
			@vaca = Alimento.new("Carne vaca", 21.1, 0.0, 3.1, 50.0, 164.0)#500gr
			@pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)#500gr
			@cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)#500gr

                        @alimentosLC = Lista.new(nil,nil)
                        @alimentosLC.insert_group([@lentejas, @cerdo])
                        @gramosLC = Lista.new(nil,nil)
                        @gramosLC.insert_group([300, 500])

                        @platoLC = Plato.new("Lentejas y cerdo", @alimentosLC, @gramosLC)
                        @eficienciaLC = Eficiencia.new("Lentejas y cerdo", @alimentosLC, @gramosLC)

                        @alimentosPV = Lista.new(nil,nil)
                        @alimentosPV.insert_group([@pollo, @vaca])
                        @gramosPV = Lista.new(nil,nil)
                        @gramosPV.insert_group([500,500])

                        @platoPV = Plato.new("Pollo y vaca", @alimentosPV, @gramosPV)
                        @eficienciaPV = Eficiencia.new("Pollo y vaca", @alimentosPV, @gramosPV)
                end

                it "Comparación del valor nutricional y eficiencia" do
#                        expect(@platoLC > @platoPV).to eq(true)
#                        expect(@platoLC < @platoPV).to eq(false)
#                        expect(@platoLC == @platoLC).to eq(true)
#                        expect(@platoLC != @platoPV).to eq(true)

#                        expect(@eficienciaLC > @eficienciaPV).to eq(false)
#                        expect(@eficienciaLC < @eficienciaPV).to eq(true)
#                        expect(@eficienciaLC == @eficienciaLC).to eq(true)
#                        expect(@eficienciaLC != @eficienciaPV).to eq(true)

                end

		it "Enumerar dieta Carnívora" do
                        @dieta_car = Lista.new(nil, nil)
                        @dieta_car.insert_group([@platoPV, @platoLC])
                        expect(@dieta_car.min).to eq(@platoPV)
                        expect(@dieta_car.max).to eq(@platoLC)
                        expect(@dieta_car.sort).to eq([@platoPV, @platoLC])
			expect(@dieta_car.collect{|x| x.get_kcal + 10}).to eq([1235.5, 1667.3])
                        expect(@dieta_car.select{|x| x.get_kcal.to_i.even?}).to eq([])

                        @ef_car = Lista.new(nil, nil)
                        @ef_car.insert_group([@eficienciaPV, @eficienciaLC])
                        expect(@ef_car.min).to eq(@eficienciaLC)
                        expect(@ef_car.max).to eq(@eficienciaPV)
                        expect(@ef_car.sort).to eq([@eficienciaLC, @eficienciaPV])
			expect(@ef_car.collect{|x| x.get_kcal + 10}).to eq([1235.5, 1667.3])
                        expect(@ef_car.select{|x| x.get_kcal.to_i.even?}).to eq([])

                end

	end

	context "Calcular la huella nutricional de los platos de un menú dietético" do

		before(:all) do
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)#300gr
                        @nueces = Alimento.new("Nueces", 20.0, 21.0, 54.0, 0.3, 7.9)#200g
                        @leche = Alimento.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9)#300gr
                        @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)#100gr
                        @camarones = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)#200gr
                        
			@alimentosLC = Lista.new(nil,nil)
                        @alimentosLC.insert_group([@lentejas, @camarones])
                        @gramosLC = Lista.new(nil,nil)
                        @gramosLC.insert_group([300, 200])

                        @eficienciaLC = Eficiencia.new("Lentejas y camarones", @alimentosLC, @gramosLC)

                        @alimentosNLC = Lista.new(nil,nil)
                        @alimentosNLC.insert_group([@nueces, @leche, @chocolate])
                        @gramosNLC = Lista.new(nil,nil)
                        @gramosNLC.insert_group([200, 300, 100])

			@eficienciaNLC = Eficiencia.new("Postre de chocolate y nueces", @alimentosNLC, @gramosNLC)


                        @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)#100gr
                        @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)#200gr

                        @alimentosTLC = Lista.new(nil,nil)
                        @alimentosTLC.insert_group([@tofu, @lentejas, @cerveza])
                        @gramosTLC = Lista.new(nil,nil)
                        @gramosTLC.insert_group([100, 300, 200])

                        @eficienciaTLC = Eficiencia.new("Tofu, Lentejas y cerveza", @alimentosTLC, @gramosTLC)

			
			@menu = [@eficienciaLC, @eficienciaNLC, @eficienciaTLC]
			@precio = [7.35, 3.10, 4.50]

		end

		it "Calcular la huella nutricional" do
			expect(@eficienciaLC.hn).to eq(3)
			expect(@eficienciaNLC.hn).to eq(3)
			expect(@eficienciaTLC.hn).to eq(2)
		end

		it "Obtener plato con mayor huella nutricional" do
			expect(@menu.max).to eq(@eficienciaLC)
		end

		it "Incrementar el precio de los platos en base al plato de mayor huella" do
			mayorHN = @menu.index(@menu.max)             
			aumento_de_precio = (0.25*@precio[mayorHN]).round(2)
			@precio_aumentado = [9.19, 4.94, 6.34]
                        expect(@precio.collect{ |x| x + aumento_de_precio}).to eq(@precio_aumentado)
		end

	end
end

##########################################################################################################################
RSpec.describe PlatoDSL do
        context "Práctica 10 - Plato DSL" do
		before(:all) do
			@primer_plato = PlatoDSL.new("Tequeños") do
				alimento "Masa de trigo", :gramos => "300", :proteinas => "39.63", :hidratos => "216", :lipidos => "0", :gases => "1.2", :terreno => "5.6"
				alimento "Queso llanero", :gramos => "200", :proteinas => "22", :hidratos => "10", :lipidos => "16", :gases => "13.5", :terreno => "53.2"
                        end
          
			@segundo_plato = PlatoDSL.new("Hamburguesa de la casa") do
				alimento "Carne de vaca", :gramos => "100", :proteinas => "21.1", :hidratos => "0", :lipidos => "3.1", :gases => "50", :terreno => "164"
				alimento "Pan de semillas", :gramos => "200", :proteinas => "15", :hidratos => "104", :lipidos => "2.6", :gases => "0.2", :terreno => "10"
                                alimento "Queso cheddar", :gramos => "20", :proteinas => "5", :hidratos => "0.23", :lipidos => "6.3", :gases => "11", :terreno => "41"
                                alimento "Bacon", :gramos => "100", :proteinas => "14.6", :hidratos => "0", :lipidos => "69.3", :gases => "57", :terreno => "180"
				alimento "Salsa especial de la casa", :gramos => "10",:proteinas => "0.5", :hidratos => "0.42", :lipidos => "0.11", :gases => "1.1", :terreno => "0.2"

			end
		end

		it "Declaración de la clase PlatoDSL" do
			@plato1 = PlatoDSL.new("Plato de ejemplo")
		end

		it "Alimentos del plato" do
			@hamburguesa_ejemplo = PlatoDSL.new("Hamburguesa de la casa") do
				alimento "Carne de vaca", :gramos => "100 gr"
				alimento "Pan de semillas", :gramos => "200 gr"
				alimento "Queso cheddar", :gramos => "20 gr"
				alimento "Bacon", :gramos => "100 gr"
				alimento "Salsa especial de la casa", :gramos => "10 gr"
			end
		end

		it "Salida formateada del plato" do
			puts @primer_plato.to_s
			puts @segundo_plato.to_s
		end

	end
end
