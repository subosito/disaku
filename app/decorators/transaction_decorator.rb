class TransactionDecorator < ApplicationDecorator
  delegate_all
  decorates_association :category

  def label
    category.label
  end
end
