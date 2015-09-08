class Complaint < ActiveRecord::Base
	belongs_to :entity
	belongs_to :user
	has_many :likes

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :detail, :title, :entity_id, presence: true

	attr_accessor :entity_name

	auto_html_for :url do
		html_escape
		image
		youtube(:width => 400, :height => 250, :autoplay => true)
		link :target => "_blank", :rel => "nofollow"
		simple_format
	end

	validate :url_or_image

	def exist_like(user)
		Like.where(complaint_id: self.id, email: user.email, user_id: user.id).count > 0
	end
	
	private 
	def url_or_image
	  if  (url.blank? and image.blank?)
        errors.add(:base, "Debe incluir una imagen o un link con la publicidad.")
      end
	end
end
