# == Schema Information
#
# Table name: art_works
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArtWorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
