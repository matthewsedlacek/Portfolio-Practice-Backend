class PortfoliosController < ApplicationController
    def index
        portfolios = Portfolio.select{|portfolio| portfolio.user_id == current_user.id }
        render json: portfolios, include: ['transactions.stock_price', 'transactions.stock_price.company']
        # company = Company.all
        # render json: {portfolios, include: ['transactions.stock_price'], company: CompanySerializer.new(company)}
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
        params.require(:portfolio).permit(:name, :starting_value, :user_id, :locked_in_value, :available_cash)
    end
end

