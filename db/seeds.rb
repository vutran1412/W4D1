# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Table name: art_works
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null

# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null

User.create(username: 'Vu')
User.create(username: 'Kevin')
User.create(username: 'Ben')

ArtWork.create(title: "Mona Lisa",image_url: "https://www.pinterest.com/pin/280630620511704198/", artist_id: 1)
ArtWork.create(title: "Starry Night",image_url: "https://www.farmersalmanac.com/inspiration-for-van-goghs-starry-night-20378", artist_id: 2)
ArtWork.create(title: "Hands of the Peasants",image_url: "https://www.vincent-van-gogh-gallery.org/Study-Of-Two-Peasants.html", artist_id: 3)

ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 2, viewer_id: 3)
ArtworkShare.create(artwork_id: 3, viewer_id: 1)