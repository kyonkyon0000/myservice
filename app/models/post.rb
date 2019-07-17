class Post < ApplicationRecord

  #空欄投稿と140字以上の投稿を弾く
  validates :content,{presence: true, length:{maximum: 140}}

end
