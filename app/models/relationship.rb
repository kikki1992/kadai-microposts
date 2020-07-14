class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name:"User"
  #class_name Userを追加-followはユーザからIDを探すように
end
