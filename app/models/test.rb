class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  # has_many :tests_users
  # has_many :users, through: :tests_users

  has_many :test_passages
  has_many :users, through: :test_passages

  scope :level, ->(level) { where(level: level) }

  scope :slow, -> { level(0..1) }
  scope :medium, -> { level(2..3) }
  scope :hard, -> { level(5..Float::INFINITY) }

  scope :name_of_tests, ->(category_title) { joins(:categories).where("categories.title LIKE ?", "%#{ category_title }%") }

  validates :title, presence: true, uniqueness: { scope: :level, message: "Title and level must be unique" }
  validates :level, presence: true, numericality: { only_integer: true }
end
