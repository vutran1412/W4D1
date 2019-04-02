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

class ArtWork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id,
    message: 'Artist cannot have two pieces with same title.' }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User,
        dependent: :destroy

    has_many :artwork_viewers,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_viewers,
        source: :viewer
end
