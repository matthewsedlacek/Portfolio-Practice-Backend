class WatchlistCompaniesController < ApplicationController
  before_action :set_watchlist_company, only: [:show, :update, :destroy]

  def index
    watchlist_companies = current_user.watchlist.watchlist_companies
    render json: watchlist_companies
  end

  def show
    render json: WatchlistCompanySerializer.new(@watchlist_company)
  end

  def create
    watchlist_company = WatchlistCompany.new(watchlist_company_params)
    if watchlist_company.save
      render json: watchlist_company, status: :created
    else
      render json: { errors: watchlist_company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @watchlist_company.update(watchlist_company_params)
      render json: WatchlistCompanySerializer.new(@watchlist_company)
    else
      render json: { errors: @watchlist_company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @watchlist_company.destroy
    render json: { info: 'Deleted' }
  end

  private

  def set_watchlist_company
    @watchlist_company = current_user.watchlist&.watchlist_companies&.find_by(id: params[:id])
    render json: { error: 'Not found' }, status: :not_found unless @watchlist_company
  end

  def watchlist_company_params
    params.require(:watchlist_company).permit(:watchlist_id, :company_id)
  end
end
