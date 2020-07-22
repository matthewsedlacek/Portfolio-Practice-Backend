class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :stock_price_id, :portfolio_id, :"buy_sell", :quantity
  belongs_to :stock_price
end
