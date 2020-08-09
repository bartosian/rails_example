class Account < ActiveRecord::Base
	validates :balance, numericality: {greater_than_or_equal_to:0}
	
	def withdraw(amount)
		adjust_balance_and_save!(-amount)
	end

	def deposit(amount)
		adjust_balance_and_save!(amount)
	end

	private
	def adjust_balance_and_save!(amount)
		self.balance += amount
		save!
	end
end

begin
	Account.transaction do
		paul.deposit(350)
		peter.withdraw(350)
	end
rescue
	puts "Transfer aborted"
end	

