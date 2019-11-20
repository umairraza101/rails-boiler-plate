class Event < ApplicationRecord
  enum status: %i[draft published]
  has_attached_file :photo, default_url: '/events.jpeg'
  validates_attachment_content_type :photo, content_type: %w[image/jpg image/jpeg image/png image/gif]

  validates_presence_of :title, if: Proc.new { |e| e.published? }
  validates_presence_of :start_date
  validates_presence_of :end_date
  validate :end_date_gt_start_date, if: Proc.new { |e| e.published? }

  belongs_to :user

  def photo_url
    photo.url
  end

  private

  def end_date_gt_start_date
    errors.add(:start_date, 'must be earlier than end_date') if start_date > end_date
  end
end
