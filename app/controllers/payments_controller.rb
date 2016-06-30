class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payments_params)
    @payment.save
    redirect_to payment_path
  end

  private

  def payments_params
    params.require(:payment).permit(:date, :description, :value)
  end

end
