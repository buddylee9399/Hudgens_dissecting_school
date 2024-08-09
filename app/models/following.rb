# == Schema Information
#
# Table name: followings
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
# Indexes
#
#  index_followings_on_followed_id                  (followed_id)
#  index_followings_on_follower_id                  (follower_id)
#  index_followings_on_follower_id_and_followed_id  (follower_id,followed_id) UNIQUE
#
class Following < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
