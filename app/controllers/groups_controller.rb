class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @message = Message.new
  end
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    redirect_to group_messages_path(@group)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.save
      @group.update(create_params)
      redirect_to group_messages_path(@group.id)
      flash[:notice] = "変更が完了しました"
    end
  end

  private
  def create_params
    params.require(:group).permit(:name,:user_ids => [])

  end
end
