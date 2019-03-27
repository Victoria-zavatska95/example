class Userparam < ApplicationRecord
    belongs_to :user

    validates :firstname, :lastname, :age, presence: true
    validates :age, numericality: { only_integer: true, message: "only allows int" }
    validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :lastname,:firstname, length: { in: 3..20 }

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "50x50" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
