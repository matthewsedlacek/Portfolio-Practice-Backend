class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :portfolio_id, :buy_sell, :quantity, :value, :share_price, :company_id, :created_at
  belongs_to :company
end

