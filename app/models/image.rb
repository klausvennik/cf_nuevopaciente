require 'cloudinary'

class Image < ApplicationRecord
	attr_accessor :image
	
	def upload
		response = Cloudinary::Uploader.upload(image, options = {})
		self.url = response["secure_url"]
		self.public_id = response["public_id"]
		self.version = response["version"]
		self.save
	end
end