class Game < ApplicationRecord
	scope :order_score, ->{ order(score: :desc) }
	scope :order_letter, ->{ order(letter_count: :desc) }
	scope :order_miss, ->{ order(:miss_count) }

	belongs_to :user
end
