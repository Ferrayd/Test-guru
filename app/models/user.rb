# require "digest/sha1"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_and_belongs_to_many :tests
  # has_many :tests_users
  # has_many :tests, through: :tests_users
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: "Test", foreign_key: :user_id
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  # has_secure_password
  scope :tests, ->(level) { joins(:tests).where(tests: { level: level }) }
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "некорректный формат" }
  # validates :password, presence: true # , with: /^[A-Za-z0-9]+$/
  # validates :email, presence: true, uniqueness: true # , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
