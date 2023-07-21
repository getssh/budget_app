class ExchangesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def index
  end

  def new
    @exchange = @category.exchanges.new
  end

  def create
    # @category = Category.find(params[:category_id])
    @exchange = Exchange.new(exchange_params)
    # @exchange.author = current_user

    if @exchange.save
      redirect_to category_exchanges_path(@category), notice: 'Exchange was successfully created.'
    else
      render :new
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:name, :amount, :author_id, category_ids: [])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
