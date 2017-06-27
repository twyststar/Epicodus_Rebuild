class Lesson < ActiveRecord::Base
  belongs_to :week

  validates :title, :presence => true
  validates :content, :presence => true
  validates :week_id, :presence => true

  def previous
    week.lessons.where('number < ?', self.number).last
  end
  def next
    week.lessons.where('number > ?', self.number).first


  end
end
