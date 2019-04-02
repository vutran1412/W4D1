# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
    validates :viewer_id, uniqueness: { scope: :artwork_id,
    message: "Artwork can only be shared once per user" }

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :ArtWork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User,
        dependent: :destroy
end
