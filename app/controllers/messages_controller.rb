# coding: utf-8

class MessagesController < ApplicationController


  def index
    @message = Message.new
    # redirect_to :action => "index"
  end
  def create
    @message = Message.create(create_params)
      unless @message.save
        flash[:error] = "空欄のため保存できません"
      end
    redirect_to :action => "index"

  end

  private
  def create_params
    params.require(:message).permit(:body)
    
  end

end
