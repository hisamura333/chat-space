# coding: utf-8

class MessagesController < ApplicationController


  def index
    @message = Message.new
    # redirect_to :action => "index"
  end
  def create
    @message = Message.create(create_params)
      if @message.save
        flash[:success] = "OK!"
        redirect_to acction: 'index'
      else
        flash[:error] = "空欄のため"
        render:index
      end

  end

  private
  def create_params
    params.require(:message).permit(:body)
    
  end

end
