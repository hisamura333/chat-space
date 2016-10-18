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

    it "assigns a create message to @message"do
      expect do
        post :create, message: message_params
      end.to change(Message, :count).by(1)
    end
  end
end

  #     # message = create(:message)
  #     # post :create, body: message.body
  #     # expect(assigns(:message)).to eq message











