module OrdersHelper
  def ordered
    self.where(status_id: 1)
  end

  def paid
    self.where(status_id: 2)
  end

  def cancelled
    self.where(status_id: 3)
  end

  def completed
    self.where(status_id: 4)
  end
end
