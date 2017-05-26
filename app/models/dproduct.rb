class Dproduct < ApplicationRecord
	 belongs_to :dcategory
	mount_uploader :image, ImageUploader
end
