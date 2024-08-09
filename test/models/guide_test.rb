# == Schema Information
#
# Table name: guides
#
#  id           :integer          not null, primary key
#  content      :text
#  live_updates :boolean          default(FALSE)
#  status       :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  topic_id     :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_guides_on_topic_id  (topic_id)
#  index_guides_on_user_id   (user_id)
#
# Foreign Keys
#
#  topic_id  (topic_id => topics.id)
#  user_id   (user_id => users.id)
#
require "test_helper"

class GuideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
