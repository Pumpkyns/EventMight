class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  validates_dates :start_date,  :on_or_after => lambda { Date.current }, presence :true
  validates_time :duration, presence :true
  …  private  def 
    if duration %5!==0 && duration < 0
      errors.add(:duration, "qui fait des evenements de cette durée ? il faut que ce soit multiple de 5 positif")
    end
end
  validates :title, presence :true, length: { in: 5..140}
  validates :description, presence :true, length: { in: 20..1000}
  validates :price, presence :true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000 }
  validates :location, presence :true
end
