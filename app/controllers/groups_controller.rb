class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to controller: 'messages',action: 'index'
  end
  private
  def create_params
    params.require(:group).permit(:name)
    
  end
end
