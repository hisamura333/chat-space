# users

## association
- has_many :messages
- has_many :groups, :through: :members

## table
- t.string :name, null: false


# group

## association
- has_many :messages
- has_many :users, :through: :members

## table
- t.string :name, null: false

# message

## association
- belongs_to :user
- belongs_to :group

## table
- t.text :body, null: false
- t.string :image,
- references :user, foreign_key: true
- references :group, foreign_key: true


# member

## association
- belongs_to :user
- belongs_to :group


## table
- references :user, foreign_key: true
- references :group, foreign_key: true
