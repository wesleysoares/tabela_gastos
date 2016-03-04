class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def delete
    @expense = Expense.find(params[:expense_id])
  end

  def destroy
    @expenses = Expense.all
    @expense = Expense.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :date, :price, :paid)
  end
end
