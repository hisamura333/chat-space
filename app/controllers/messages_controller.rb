# coding: utf-8

class MessagesController < ApplicationController


  def index
    @groups = Group.all
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = Message.create(create_params)
    respond_to do |format|
      if @message.save
        flash[:success] = "OK!"
        redirect_to controller: 'messages',action: 'index'and return

        msg = {name: @message.user.name, date: @message.created_at, body: @message.body}
        render :json => msg
      else
        flash[:error] = "空欄のため"
        redirect_to controller: 'messages',action: 'index'and return
      end
    end
  end

  private
  def create_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])

  end

end
