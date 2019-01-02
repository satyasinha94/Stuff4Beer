class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
    find_listing
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to listing_path(@listing)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :body, :user_id, :category_id)
  end

end
