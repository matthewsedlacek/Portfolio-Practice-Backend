class PortfolioSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :value, :user_id
end
