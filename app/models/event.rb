class Event < ApplicationRecord
  enum status: %i[draft published]

  validates_presence_of :title, if: Proc.new { |e| e.published? }
  validates_presence_of :start_date
  validates_presence_of :end_date
  validate :end_date_gt_start_date, if: Proc.new { |e| e.published? }

  belongs_to :user

  def photo
    '/events.jpeg'
  end

  private

  def end_date_gt_start_date
    errors.add(:start_date, 'must be earlier than end_date') if start_date > end_date
  end
end
