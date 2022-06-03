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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
