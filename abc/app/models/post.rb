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

  belongs_to :user

end
