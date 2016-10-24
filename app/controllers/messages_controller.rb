# coding: utf-8

class MessagesController < ApplicationController


  def index
    @groups = Group.all
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = Message.create(create_params)
      if @message.save
        @message.update(user_id: current_user.id, group_id: params[:group_id])
        flash[:success] = "OK!"
        # redirect_to acction: 'show',group_id: params[:group_id]
        redirect_to :back
      else
        flash[:error] = "空欄のため"
        redirect_to :back
      end

  end

  private
  def create_params
    params.require(:message).permit(:body)

  end

end
