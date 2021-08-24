class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category."}
    validate :clickbait_title

    def clickbait_title
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "must be clickbait-y")
        end
    end
end
