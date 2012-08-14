# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :string(255)      not null
#  title       :string(255)      not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'posts.created_at DESC'




end
