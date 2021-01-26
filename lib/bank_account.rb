require 'pry'
class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance = self.balance + 1000
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid? #wants a bool
        if self.balance > 0 && self.status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        self.status = "closed"
    end
end
