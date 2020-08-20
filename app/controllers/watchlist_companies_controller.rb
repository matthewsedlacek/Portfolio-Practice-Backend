class WatchlistCompaniesController < ApplicationController
    def index
        watchlist_companies = current_user.watchlist.watchlist_companies
        render json: watchlist_companies

    end
    
    def show
        watchlist_company = WatchlistCompany.find_by(id: params[:id])
        render json: WatchlistCompanySerializer.new(watchlist_company)
    end

    def create
        watchlist_company = WatchlistCompany.create(watchlist_company_params)
        render json: watchlist_company
    end

    def edit
        watchlist_company = WatchlistCompany.update(watchlist_company_params)
        render json: WatchlistCompanySerializer.new(watchlist_company)
    end

    def destroy
        watchlist_company = WatchlistCompany.find(params[:id])
        watchlist_company.destroy
        render json: {info: "Deleted"}
    end

    private
    def watchlist_company_params
        params.require(:watchlist_company).permit(:watchlist_id, :company_id)
    end
end
