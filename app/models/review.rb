class Review < ApplicationRecord
  # belongs_to :profile
  belongs_to :buyer, class_name: "Profile", optional: true 
  benlongs_to :seller, class_name: "Profile"
end
