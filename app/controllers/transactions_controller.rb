class TransactionsController < ApplicationController
    def index
        transactions = Transaction.all
        render json: transactions
    end
    
    def show
        transaction = Transaction.find_by(id: params[:id])
        render json: TransactionSerializer.new(transaction)
    end

    def create
        transaction = Transaction.create(portfolio_params)
        render json: TransactionSerializer.new(transaction)
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
        params.require(:transaction).permit(:stock_price_id, :portfolio_id, :buy_sell, :quantity, :purchase_price)
    end
end
