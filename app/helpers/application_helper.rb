module ApplicationHelper
  def boostrap_class(alert)
    { success: 'alert-success', error: 'alert-danger', notice: 'alert-success', warning: 'alert-warning',
      danger: 'alert-danger', alert: 'alert-danger' }[alert.to_sym]
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{boostrap_class(msg_type.to_sym)} fade in") do
        concat(content_tag(:button, id: "close-button", class: "close", type: :button, data: { dismiss: 'alert' }, "aria-label" => :Close) do
          concat content_tag(:span, "&times;".html_safe, "aria-hidden" => true)
        end)
        concat message
      end)
    end
    nil
  end

  def decimal_format(f_number)
    f_number = f_number.to_s
    if !f_number.include?('.')
      return f_number << '.00'
    elsif f_number.split('.').last.size < 2
      return f_number << '0'
    else
      return f_number
    end
  end

  def generate_order_id
    p_total = Order.order("id DESC").first.try(:id).to_i
    if p_total < 10
      return "DH0#{p_total}"
    else
      return "DH#{p_total}"
    end
  end
end
