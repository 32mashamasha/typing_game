class Game < ApplicationRecord
	scope :order_score, ->{ order(score: :desc) }
	scope :order_letter, ->{ order(letter_count: :desc) }
	scope :order_miss, ->{ order(:miss_count) }
	scope :by_category, ->(category_id) {where(category_id: category_id) }

	belongs_to :user
end
