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
    flash[:listing] = find_listing.id
  end

  def search
    @listing = Listing.find_by(title: params[:search].strip)
    if @listing
      redirect_to listing_path(@listing)
    else
      flash[:notice] = "Listing not found!"
      redirect_to main_path
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to listing_path(@listing)
    else
      flash[:notice] = "Invalid Listing!"
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    @listing.user_id = current_user.id
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

  def listing_params
    params.require(:listing).permit(:title, :body, :user_id, :category_id, :search)
  end

end
