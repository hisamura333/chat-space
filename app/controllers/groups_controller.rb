class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    if @group.save
      redirect_to controller: 'messages',action: 'index'
    else
    end
  end

  def edit
    @group = Group.find(params[:id])
    
  end
  def update
    @group = Group.find(params[:id])
    if @group.save
      @group.update(create_params)
      redirect_to root_path
    else
    end
    
  end
  private
  def create_params
    params.require(:group).permit(:name,{:user_ids => []})
    
  end
end
