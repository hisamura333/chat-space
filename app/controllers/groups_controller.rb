class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    redirect_to group_messages_path(@group.id)

  end

  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.save
      @group.update(create_params)
      redirect_to group_messages_path(@group.id)
    end
  end

  private
  def create_params
    params.require(:group).permit(:name,{:user_ids => []})
    
  end
end
