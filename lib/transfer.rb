class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.receiver.balance+= self.amount
      self.sender.balance-= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" && self.receiver.balance >= self.amount
      self.receiver.balance-= self.amount
      self.sender.balance+= self.amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    end
    # binding.pry
end
