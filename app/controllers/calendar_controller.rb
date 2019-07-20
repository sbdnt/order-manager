class CalendarController < ApplicationController
  def show
  	@sub_title = " - Lịch thực hiện đơn hàng"
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	month_of_date = @date.month
  	@orders = []
  	Order.all.each do |order|
  		if order.start_date.month == month_of_date  || order.end_date.month == month_of_date 
  			@orders << order
  		end
  	end
  end

  def move_task
  	### update tasks
  	if params[:tasks].present?
  		days = params[:days].to_i
  		params[:tasks].each do |task|
  			event = Event.find_by(id: task.to_i)
  			order = event.order
  			if params[:dir].to_i == 1
  				event_date = event.event_date - days
  			elsif params[:dir].to_i == 2
  				event_date = event.event_date + days
  			end
  			if  event_date > order.start_date && event_date < order.end_date
  				event.update(event_date: event_date)
  			end
  		end
  	end
  	redirect_to action: :show
  end
  
  private


end