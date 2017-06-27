class Week < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  
  validates :description, :presence => true
  validates :timeframe, :presence => true
  validates :course_id, :presence => true
end
