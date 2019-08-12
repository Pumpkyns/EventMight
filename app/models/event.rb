class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name 'User'
  validates_date :start_date,  :on_or_after => lambda { Date.current }, presence: true
 validates :duration, presence: true
  validate :duration_multiple_of_5?
    def duration_multiple_of_5?
      if self.duration % 5 != 0 || self.duration < 0
      errors.add(:duration, "You can't do that. The duration must end by 0 ou 5 and be a positive number.")
      end
    end  
  validates :title, presence: true, length: { in: 5..140}
  validates :description, presence: true, length: { in: 20..1000}
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1001 }
  validates :location, presence: true
end
