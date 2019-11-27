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

end
