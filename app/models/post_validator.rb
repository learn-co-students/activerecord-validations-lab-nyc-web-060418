class PostValidator < ActiveModel::Validator

CLICKBAIT_PATTERNS = ["Won't Believe", "Secret", "Top #{/[0-9]/}", "Guess"]

  def validate(record)
    CLICKBAIT_PATTERNS.each do |pattern|
      if record.title.include? (pattern)
        return true
      else
        record.errors[:title] << 'Not clickbait!'
      end
    end
  end

end
