class WatchlistsController < ApplicationController
    def index
        watchlists = Watchlist.select{|watchlist| watchlist.user_id == current_user.id }
        render json: watchlists, include: ['stock_prices.company']
        # company = Company.all
        # render json: {portfolios, include: ['transactions.stock_price'], company: CompanySerializer.new(company)}
    end
    
    def show
        watchlist = Watchlist.find_by(id: params[:id])
        render json: watchlist
    end

    def create
        watchlist = Watchlist.create(watchlist_params)
        render json: WatchlistSerializer.new(watchlist)
    end

    def update
        watchlist = Watchlist.find_by(id: params[:id])
        watchlist.update(watchlist_params)
        render json: watchlist
    end

    def destroy
        watchlist = Watchlist.find(params[:id])
        watchlist.destroy
        render json: {info: "Deleted"}
    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:id, :user_id)
    end
end
