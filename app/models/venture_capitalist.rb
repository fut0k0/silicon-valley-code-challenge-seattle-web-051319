class VentureCapitalist
	attr_accessor :total_worth
	attr_reader :name
	
	@@all = []
	
	def initialize(name)
		@name = name
		@total_worth = 0
		@@all.push(self)
	end
	
	def self.all
		@@all
	end
	
	def self.tres_commas_club
		self.all.select {|vencap| vencap.total_worth > 1000000000}
	end
	
	def offer_contract(startup, type, amount)
		FundingRound.new(startup, self, type, amount)
	end
	
	def funding_rounds
		FundingRound.all.select {|round| round.venture_capitalist == self}
	end
	
	def portfolio
		self.funding_rounds.map {|round| round.startup} .uniq
	end
	
	def biggest_investment
		big = 0.0
		big_round = nil
		self.funding_rounds.each do |round|
			if round.investment > big
				big = round.investment
				big_round = round
			end
		end
		big_round
	end
	
	def invested(domain)
		total = 0
		self.funding_rounds.each do |round|
			total += round.investment if round.startup.domain == domain
		end
		total
	end
end