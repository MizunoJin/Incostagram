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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
