# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :username, presence: true, null: false, uniqueness: true
    
    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :ArtWork

    has_one :viewed_artwork,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :viewed_artwork,
        source: :artwork
end
