class Product < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image

  def self.search(search)
    if search != ""
      Product.where('name LIKE(?) OR content LIKE(?)', "%#{params[:name]}%", "%#{params[:content]}%")
    else
      Product.all
    end
  end

  validates :name, presence: true
  validates :content, presence: true
  validates :amount, presence: true
  validates :address, presence: true
end
