class StockPricesController < ApplicationController
    def index
        stock_prices = StockPrice.all
        render json: stock_prices
    end
    
    def show
        stock_price = StockPrice.find_by(id: params[:id])
        render json: stock_price
    end

    def create
        stock_price = StockPrice.create(stock_price_params)
        render json: StockPriceSerializer.new(stock_price)
    end

    def update
        stock_price = StockPrice.find_by(id: params[:id])
        stock_price.update(stock_price_params)
        render json: stock_price
    end

    def destroy
        stock_price = StockPrice.find(params[:id])
        stock_price.destroy
        render json: {info: "Deleted"}
    end

    private
    def stock_price_params
        params.require(:stock_price).permit(:company_id, :current_price, :dollar_change, :percent_change, :as_of_time, :daily_high, :daily_low, :fifty_two_week_high, :fifty_two_week_low, :transacted)
    end
end

