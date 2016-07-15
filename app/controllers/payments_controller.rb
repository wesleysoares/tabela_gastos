class PaymentsController < ApplicationController
  before_action :find_payment, only: [:edit, :update]

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payments_params)
    if @payment.save
      redirect_to payment_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @payment.update(payments_params)
      redirect_to payment_path
    else
      render 'edit'
    end
  end

  def delete
    @payment = Payment.find(params[:payment_id])
  end

  def destroy
    @payments = Payment.all
    @payment = Payment.find(params[:id])
    @payment.destroy
  end

  private

  def payments_params
    params.require(:payment).permit(:date, :description, :value)
  end

  def find_payment
    @payment = Payment.find(params[:id])
  end
end
