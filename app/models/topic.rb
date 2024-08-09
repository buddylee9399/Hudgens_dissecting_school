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
class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true, uniqueness: true
  has_many :guides, dependent: :destroy  
  scope :ordered, -> {order(created_at: :desc)}
end
