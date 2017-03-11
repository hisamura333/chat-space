# coding: utf-8

class MessagesController < ApplicationController


  def index
    @groups = Group.all
    @message = Message.new
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages

    respond_to do |format|

      format.html{}
      format.json{ render json:{
        name: current_user.name,
        messages: @messages
        }
      }
    end
  end

  def create
    @message = Message.create(create_params)
    respond_to do |format|
      if @message.save
        flash[:success] = "OK!"
        redirect_to group_messages_path(@message.group_id)and return

        msg = {name: @message.user.name, date: @message.created_at, body: @message.body,image: @message.image}
        render :json => msg
      else
        flash[:error] = "空欄のため送信できませんでした"
        redirect_to group_messages_path(@message.group_id)and return
      end
    end
  end


  private
  def create_params
    params.require(:message).permit(:body,:image).merge(user_id: current_user.id, group_id: params[:group_id])

  end
end
