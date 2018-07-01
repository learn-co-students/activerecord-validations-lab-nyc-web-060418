class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CB_OPTS = [
   /Won't Believe/i,
   /Secret/i,
   /Top [0-9]*/i,
   /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
  # def expiration_date_cannot_be_in_the_past
  #  if expiration_date.present? && expiration_date < Date.today
  #     errors.add(:expiration_date, "can't be in the past")
  #   end
  # end

end
