class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :name
      t.string :logo
      t.string :sector
    end
  end
end
