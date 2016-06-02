class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipt_path
    else
      render 'new'
    end
  end

  private

  def receipt_params
    params.require(:receipt).permit(:date, :description, :value)
  end
end
