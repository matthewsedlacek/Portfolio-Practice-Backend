class PortfoliosController < ApplicationController
    def index
        portfolios = Portfolio.select{|portfolio| portfolio.user_id == current_user.id }
        render json: portfolios, include: ['transactions.stock_price']
    end
    
    def show
        portfolio = Portfolio.find_by(id: params[:id])
        render json: PortfolioSerializer.new(portfolio)
    end

    def create
        portfolio = Portfolio.create(portfolio_params)
        render json: PortfolioSerializer.new(portfolio)
    end

    def edit
        portfolio = Portfolio.update(portfolio_params)
        render json: PortfolioSerializer.new(portfolio)
    end

    def destroy
        portfolio = Portfolio.find(params[:id])
        portfolio.destroy
        render json: {info: "Deleted"}
    end

    private
    def portfolio_params
        params.require(:portfolio).permit(:name, :value, :user_id)
    end
end
