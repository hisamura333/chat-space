class MessagesController < ApplicationController

  def index
    @message = Message.new
    # redirect_to :action => "index"
  end
  def create
    redirect_to :action => "index"
  end

end
