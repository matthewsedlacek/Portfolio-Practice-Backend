class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :update, :destroy]

  def index
    portfolios = Portfolio.where(user_id: current_user.id).includes(transactions: :company)
    render json: portfolios, include: ['transactions', 'transactions.company']
  end

  def show
    render json: @portfolio
  end

  def create
    portfolio = Portfolio.new(portfolio_params)
    portfolio.user_id = current_user.id
    if portfolio.save
      render json: portfolio, status: :created
    else
      render json: { errors: portfolio.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json: { errors: @portfolio.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @portfolio.destroy
    render json: { info: 'Deleted' }
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find_by(id: params[:id], user_id: current_user.id)
    render json: { error: 'Not found' }, status: :not_found unless @portfolio
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :starting_value, :locked_in_value, :available_cash)
  end
end
