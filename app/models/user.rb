class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 25 }
end
