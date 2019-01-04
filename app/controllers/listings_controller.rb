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

  # def search
  #   @listing = Listing.find_by(title: params[:search])
  #   redirect_to listing_path(@listing)
  # end

  def create
    @listing = Listing.new(create_listing_params)
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
