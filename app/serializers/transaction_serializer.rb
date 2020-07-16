class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :stock_price_id, :portfolio_id, :"buy/sell", :quantity, :purchase_price, :date_time
end
