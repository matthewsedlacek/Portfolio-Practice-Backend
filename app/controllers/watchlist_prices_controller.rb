class WatchlistPricesController < ApplicationController
    def index
        watchlist_prices = WatchlistPrice.all
        render json: watchlist_prices
    end
    
    def show
        watchlist_price = WatchlistPrice.find_by(id: params[:id])
        render json: WatchlistPriceSerializer.new(watchlist_price)
    end

    def create
        watchlist_price = WatchlistPrice.create(watchlist_price_params)
        render json: watchlist_price
    end

    def edit
        watchlist_price = WatchlistPrice.update(watchlist_price_params)
        render json: WatchlistPriceSerializer.new(watchlist_price)
    end

    def destroy
        watchlist_price = WatchlistPrice.find(params[:id])
        watchlist_price.destroy
        render json: {info: "Deleted"}
    end

    private
    def watchlist_price_params
        params.require(:watchlist_price).permit(:watchlist_id, :stock_price_id)
    end
end
