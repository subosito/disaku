module ApplicationHelper
  def to_currency(amount)
    number_to_currency(amount, unit: 'Rp', precision: 0, format: "%u %n", separator: ',', delimiter: '.')
  end
end
