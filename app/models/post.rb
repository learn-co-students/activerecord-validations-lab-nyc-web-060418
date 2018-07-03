class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fictiion Non-fiction)}
  validate :is_clickbait?

  

  CLICKBAIT = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def is_clickbait?
    if CLICKBAIT.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait, yo!")
    end
  end


end
