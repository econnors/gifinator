class Gif < ActiveRecord::Base

validates :title, presence: true
# validates :gif, presence: true
validates :user_id, presence: true

belongs_to :user
has_many :comments, dependent: :destroy
has_and_belongs_to_many :tags

#AWS S3 set credentials
	def self.new_aws_request
  	s3 = AWS::S3.new(:access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY'])
		return s3
	end

#AWS Create bucket
	def self.gif_bucket
		bucket = s3.buckets[ENV['BUCKET']]
		return bucket
	end

#get object from S3
	def self.get_gif
		s3 = AWS::S3.new(:access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY'])
		bucket = s3.buckets[ENV['BUCKET']]
		obj = bucket.objects['key']
		data = object.read 
		return data
	end


end



