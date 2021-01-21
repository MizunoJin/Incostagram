# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  micropost_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_likes_on_micropost_id  (micropost_id)
#  index_likes_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (micropost_id => microposts.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  # counter_culture :micropost
  validates_uniqueness_of :micropost_id, scope: :user_id
end
