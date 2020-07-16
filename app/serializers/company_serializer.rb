class CompanySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :ticker, :name, :logo, :sector
end
