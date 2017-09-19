class Product < ApplicationRecord
  belongs_to :category

  has_many :photos
  accepts_nested_attributes_for :photos

   validates :salt, presence: true
   validates :sugar, presence: true
   validates :sauces, presence: true
   validates :vinegar, presence: true
   validates :papper, presence: true
   validates :oil, presence: true
   validates :salt, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负盐长什么样！"}
   validates :sugar, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负糖长什么样！"}
   validates :sauces, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负酱油长什么样！"}
   validates :vinegar, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负醋长什么样！我就知道副处。"}
   validates :papper, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负胡椒粉长什么样！"}
   validates :oil, numericality: {greater_than_or_equal_to: 0, message: "来来来，你告诉我，负油长什么样！我就知道富有。"}

  mount_uploader :image, ImageUploader
  acts_as_list
  scope :random3, ->{ order("RANDOM()").limit(rand(3..5)) }
  scope :random4, ->{ order("RANDOM()").limit(rand(4..6)) }
  scope :random5, ->{ order("RANDOM()").limit(rand(5..7)) }
  scope :random6, ->{ order("RANDOM()").limit(rand(6..8)) }
  scope :random7, ->{ order("RANDOM()").limit(rand(7..9)) }

  has_many :comments


  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  before_validation :generate_friendly_id, :on => :create

    def to_param
     self.friendly_id
    end

   protected

   def generate_friendly_id
     self.friendly_id ||= SecureRandom.uuid
   end

end
