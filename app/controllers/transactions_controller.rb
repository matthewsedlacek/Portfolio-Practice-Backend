class TransactionsController < ApplicationController
    def index
        transactions = Transaction.select{|transaction| transaction.portfolio.user_id == current_user.id }
        render json: transactions

    end
    
    def show
        transaction = Transaction.find_by(id: params[:id])
        render json: TransactionSerializer.new(transaction)
    end

    def create
        transaction = Transaction.create(transaction_params)
        render json: transaction
    end

    def edit
        transaction = Transaction.update(transaction_params)
        render json: TransactionSerializer.new(transaction)
    end

    def destroy
        transaction = Transaction.find(params[:id])
        transaction.destroy
        render json: {info: "Deleted"}
    end

    private
    def transaction_params
        params.require(:transaction).permit(:portfolio_id, :buy_sell, :quantity, :value, :share_price, :company_id)
    end
end
