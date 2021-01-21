# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :string(1000)     default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  micropost_id :bigint
#  parent_id    :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => comments.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  belongs_to :parent,  class_name: "Comment", optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, length: { in: 1..1000 }
end
