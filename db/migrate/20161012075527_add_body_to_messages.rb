class AddBodyToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :body, :text
    add_column :messages, :image, :string
  end
end
