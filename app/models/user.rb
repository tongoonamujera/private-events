class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  mount_uploader :image, FileUploader
  has_many :created_events, class_name: 'Event', foreign_key: 'user_id', dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :event_attended, through: :attendances, source: :event
  validates :username, presence: true
end
