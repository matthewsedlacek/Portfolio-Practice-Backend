class AddCompanyIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :company_id, :integer
  end
end
