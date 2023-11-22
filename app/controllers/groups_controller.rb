class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @transactions = @group.financial_transactions.order(created_at: :desc)
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def handle_not_found
    redirect_to groups_path, alert: 'Group not found or not accessible'
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
