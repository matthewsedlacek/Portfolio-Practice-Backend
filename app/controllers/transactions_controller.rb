class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    transactions = Transaction.joins(:portfolio).where(portfolios: { user_id: current_user.id })
    render json: transactions
  end

  def show
    render json: TransactionSerializer.new(@transaction)
  end

  def create
    portfolio = Portfolio.find_by(id: params.dig(:transaction, :portfolio_id), user_id: current_user.id)
    unless portfolio
      render json: { error: 'Portfolio not found' }, status: :not_found
      return
    end
    transaction = Transaction.new(transaction_params)
    if transaction.save
      render json: transaction, status: :created
    else
      render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: TransactionSerializer.new(@transaction)
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    render json: { info: 'Deleted' }
  end

  private

  def set_transaction
    @transaction = Transaction.joins(:portfolio)
                              .where(portfolios: { user_id: current_user.id })
                              .find_by(id: params[:id])
    render json: { error: 'Not found' }, status: :not_found unless @transaction
  end

  def transaction_params
    params.require(:transaction).permit(:portfolio_id, :buy_sell, :quantity, :value, :share_price, :company_id)
  end
end
