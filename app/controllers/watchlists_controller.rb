class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :update, :destroy]

  def index
    watchlists = Watchlist.where(user_id: current_user.id)
    render json: watchlists
  end

  def show
    render json: @watchlist
  end

  def create
    watchlist = Watchlist.new
    watchlist.user_id = current_user.id
    if watchlist.save
      render json: watchlist, status: :created
    else
      render json: { errors: watchlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    render json: @watchlist
  end

  def destroy
    @watchlist.destroy
    render json: { info: 'Deleted' }
  end

  private

  def set_watchlist
    @watchlist = Watchlist.find_by(id: params[:id], user_id: current_user.id)
    render json: { error: 'Not found' }, status: :not_found unless @watchlist
  end
end
