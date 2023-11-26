class FinancialTransactionsController < ApplicationController
  before_action :set_transaction, only: %i[edit update destroy]

  def index
    @transactions = FinancialTransaction.where(user: current_user).order(created_at: :desc)
  end

  def new
    @transaction = FinancialTransaction.new(group_id: params[:group_id])
    @transaction.group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  def create
    @transaction = FinancialTransaction.new(transaction_params)
    @transaction.user = current_user
    if @transaction.save
      redirect_to group_path(@transaction.group), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      redirect_to group_path(@transaction.group), notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction = FinancialTransaction.find(params[:id])
    @transaction.destroy
    redirect_to groups_path, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = FinancialTransaction.find(params[:id])
  end

  def transaction_params
    params.require(:financial_transaction).permit(:name, :amount, :group_id)
  end
end
