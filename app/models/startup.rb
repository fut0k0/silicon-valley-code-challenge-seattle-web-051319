class Startup
	attr_reader :name, :founder, :domain
	
	@@all = []
	
	def initialize(name, founder, domain)
		@name = name
		@founder = founder
		@domain = domain
		@@all.push(self)
	end
	
	def self.all
		@@all
	end
	
	def pivot(domain, name)
		@name = name
		@domain = domain
	end
	
	def self.find_by_founder(name)
		self.all.find {|startup| startup.founder == name}
	end
	
	def self.domains
		self.all.map {|startup| startup.domain}
	end
	
	def sign_contract(vencap, type, amount)
		FundingRound.new(self, vencap, type, amount)
	end
	
	def num_funding_rounds
		FundingRound.all.select {|round| round.startup == self} .size
	end
	
	def total_funds
		total = 0.0
		rounds = FundingRound.all.select {|round| round.startup == self}
		rounds.each {|round| total += round.investment}
		total
	end
	
	def investors
		rounds = FundingRound.all.select {|round| round.startup == self}
		rounds.map {|round| round.venture_capitalist} .uniq
	end
	
	def big_investors
		self.investors.select do |investor| 
			investor if VentureCapitalist.tres_commas_club.include?(investor)
		end
	end
end