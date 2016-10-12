chat-scape
  create.table
    add_column


users(devise)
  +add
  :name       t.string
_________________________
group
  +add
   name       t.string
_________________________
messages
  +add
  :text        t.text
  :user_id     t.references
  :group_id    t.references
_________________________
member
  +add
  :user_id     t.references
  :user_id     t.references
_________________________
