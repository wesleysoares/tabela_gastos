class ReceiptsController < ApplicationController
  before_action :find_receipts, only: [:edit, :update]

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

  def edit
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to receipt_path
    else
      render 'edit'
    end
  end

  def delete
    @receipt = Receipt.find(params[:receipt_id])
  end

  def destroy
    @receipts = Receipt.all
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
  end

  private

  def receipt_params
    params.require(:receipt).permit(:date, :description, :value, :paid)
  end

  def find_receipts
    @receipt = Receipt.find(params[:id])
  end
end
