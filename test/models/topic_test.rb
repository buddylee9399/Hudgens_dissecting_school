# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  guides_count :integer          default(0), not null
#  slug         :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_topics_on_slug  (slug) UNIQUE
#
require "test_helper"

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
