require 'rails_helper'

describe MessagesController, type: :controller do
  describe 'GET #index'do
    it "renders the :index template"do
      get :index
      expect(response).to render_template :index
    end
    it "assigns a new message to @message"do
      get :index
      expect(assigns(:message)).to be_a Message
    end
  end

  describe 'POST #create'do
    let!(:message){build(:message)}
    let!(:message_params){{body:message.body}}
    let!(:message_params_brank){{body:""}}

    it "assigns a create message to @message"do
      expect do
        post :create, message: message_params
      end.to change(Message, :count).by(1)
    end

    it "dosen't create a new message with blank body"do
      expect do
        post :create, message: message_params_brank
      end.not_to change(Message, :count)
    end
  end
end












