class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to controller: 'messages',action: 'index'
  end

  def edit
    @group = Group.find(params[:id])
    
  end
  def update
    @group = Group.find(params[:id])
    @group.update(create_params)
    redirect_to root_path
    
  end
  private
  def create_params
    params.require(:group).permit(:name)
    
  end
end
