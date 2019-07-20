class Event < ApplicationRecord
	belongs_to :order

	def self.get_event_date(date)
		event_dates = []
		Event.where(event_date: date).each do |event|
			order = Order.find_by(id: event.order_id)
			event_dates << {
				key: event.id,
				value: "#{order.orderID}-#{order.name}: #{Event.generate_step_name(event.step_name)}"
			}
		end
		return event_dates
	end

	def self.generate_step_name(step_name)
		if step_name.include?("input")
			return "Nhập liệu"		
		elsif step_name.include?("clean")
			return "Lau bóng"
		elsif step_name.include?("filter")
			return "Tách màu"
		elsif step_name.include?("package")
			return "Đóng bao"
		else
			return "Không xác định"
		end
	end
end
