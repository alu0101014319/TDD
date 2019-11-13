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

end
