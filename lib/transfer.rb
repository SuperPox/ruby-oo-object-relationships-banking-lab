require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :lasttransfer


  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @lasttransfer = 0
  end

  def valid?
    #binding.pry
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status == "pending" && @sender.balance > self.amount && @sender.status == "open" && @receiver.status == "open"
      @sender.balance = @sender.balance - self.amount
      @receiver.balance = @receiver.balance + self.amount
      @lasttransfer = self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      @sender.balance = @sender.balance + @lasttransfer
      @receiver.balance = @receiver.balance - @lasttransfer
      self.status = "reversed"
    end
  end


end
