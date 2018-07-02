class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    clickbait = [/.Won't believe./i, /.secret./, /.Top [0-9]./i, /.Guess/i]
    if clickbait.none? do |pattern|
      pattern.match(title) #This is the attribute "title" of Post
    end
      errors.add(:title, "can't be non-clickbait")
    end
  end




end
