class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def categories
    @categories = Category.all
  end

  def new
    @listing = Listing.new
  end

  def show
    find_listing
  end

  def create
    @listing = Listing.create(create_listing_params)
    redirect_to listing_path(@listing)
  end

  def edit
  end

  def update
    @listing.update(update_listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def create_listing_params
    params.require(:listing).permit(:title, :body, :user_id, :category_id)
  end

  def update_listing_params
    params.require(:listing).permit(:title, :body, :category_id)
  end

end
