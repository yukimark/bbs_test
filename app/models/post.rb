# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  attention  :boolean          default(FALSE), not null
#  deleted_at :datetime
#  name       :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :attention, inclusion: { in: [true, false] }

  acts_as_paranoid
end
