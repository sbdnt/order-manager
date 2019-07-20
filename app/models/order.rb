class Order < ApplicationRecord
	has_many :events, dependent: :destroy
end
