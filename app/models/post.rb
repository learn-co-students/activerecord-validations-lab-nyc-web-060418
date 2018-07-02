class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Ficton Non-Fiction) }

 # @clickbait = ["Won't Believe", "Secret", "Top [0-9]*", "Guess"]
 # #
 # def is_clickbait?
 #    if !@clickbait.include? { |phrase| phrase.match title }
 #      return false
 # #     errors.add(:title, "must be clickbait")
 #    end
 #  end
end
