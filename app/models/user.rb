# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  guides_count           :integer          default(0), not null
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  roles                  :string
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 
  

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :first_name, use: :slugged         
  validates_presence_of :first_name
  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:site_admin) if self.roles.blank?
      self.add_role(:admin)
      self.add_role(:customer)      
    else
      self.add_role(:customer) if self.roles.blank?
    end
  end  
  has_many :guides, dependent: :destroy

  has_many :users_are_following_this_user, class_name:  "Following",
                                           foreign_key: "followed_id",
                                           dependent:   :destroy

  has_many :followers, through: :users_are_following_this_user,
                       source: :follower

  has_many :this_user_is_following_other_users, class_name:  "Following",
                                                foreign_key: "follower_id",
                                                dependent:   :destroy

  has_many :following, through: :this_user_is_following_other_users,
                       source: :followed

  after_create :auto_follow_account

  def is_following? user_id
    self.following.where(id: user_id).any?
  end

  def is_being_followed_by? user_id
    self.followers.where(id: user_id).any?
  end

  def username
    "#{self.first_name} #{self.last_name}" 
  end

  private


    def auto_follow_account
      Following.create(
        follower_id: self.id,
        followed_id: self.id
      )
    end  
end
