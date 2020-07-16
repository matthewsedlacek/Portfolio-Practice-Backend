class StockPriceSerializer < ActiveModel::Serializer
  attributes :id, :company_id, :current_price, :dollar_change, :percent_change, :as_of_time, :daily_high, :daily_low, :transacted
end
