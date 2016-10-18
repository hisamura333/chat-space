require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with body"do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is invalid with body"do
      message = build(:message,body: "")
      message.valid?
      expect(message.errors[:body]).to include("can't be blank")
    end
  end
end
