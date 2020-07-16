class StockPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :company_id, :current_price, :dollar_change, :percent_change, :as_of_time, :daily_high, :daily_low, :fifty_two_week_high, :fifty_two_week_low, :transacted
end