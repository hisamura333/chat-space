class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.create(create_params)
    redirect_to "/groups/#{@group.id}/messages"

  end

  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.save
      @group.update(create_params)
      redirect_to "/groups/#{@group.id}/messages"
    end
  end

  private
  def create_params
    params.require(:group).permit(:name,{:user_ids => []})
    
  end
end
