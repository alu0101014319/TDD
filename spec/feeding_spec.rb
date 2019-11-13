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






end
