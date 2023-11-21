class FinancialTransactionsController < ApplicationController
    def new
        @transaction = FinancialTransaction.new
      end
      
      def create
        @transaction = current_user.financial_transactions.build(transaction_params)
        if @transaction.save
          redirect_to group_path(@transaction.group), notice: 'Transaction created successfully.'
        else
          render :new
        end
      end
      
      private
      
      def transaction_params
        params.require(:financial_transaction).permit(:name, :amount, :group_id)
      end
      
end
