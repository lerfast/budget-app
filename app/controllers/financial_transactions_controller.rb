class FinancialTransactionsController < ApplicationController
  def new
    @transaction = FinancialTransaction.new(group_id: params[:group_id])
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
    group = @transaction.group
    @transaction.destroy
    redirect_to group_path(group), notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = FinancialTransaction.find(params[:id])
  end

  def transaction_params
    params.require(:financial_transaction).permit(:name, :amount, :group_id)
  end
end
