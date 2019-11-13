RSpec.describe Alimento do
	it "Instanciando objetos" do
                @carne_vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		@carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
		@camarones = Alimento.new("Camarones", 17.6,1.5,0.6,18.0,2.0)
		@salmon = Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
		@lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
        end

end
