namespace :com_port do
  desc "TODO"
  task get_data: :environment do
  	com_ready = false
  	scales_status = Setting.find_by(name: :scales_input_status)
  	while DateTime.now.month.to_i < 5
	  	begin 
	  		# Dserialport = Serial.new 'COM6', 2400, 8, :none
	      unless com_ready
	      	serial = Serial.new('COM6', 2400, 8, :none, 1)
	      	com_ready = true
	      end
	    rescue
	    	com_ready = false
	    	p 'Error open COM6'
	    end
	    if com_ready
	    	scales_input_status = Setting.find_by(name: :scales_input_status)
	      rep = serial.read(3700)
	      if rep.present?
	      	# R01,1,XXXXXX.YY,00000,XXXXX,XXX.YY
	      	# S0,XXXXX,XXXXXXXX,XXXXX
	      	r0 = rep.scan(/S0,\d+,\d+,\d+/).last
	      	r0 = r0.to_s.split(",")
	      	if r0.present?
	      		scales_input_status.update(value: "Chạy")
	      	else
	      		scales_input_status.update(value: "Dừng")
	      	end
	      	current_balance = r0.second.to_i/100.00
		      total_balance = r0.third.to_i/100.00
	        count_balance = r0.last.to_i
	      	if total_balance > 0 && count_balance > 0 && current_balance > 0
		      	p "*******************************************************"
		      	p "Nguyen lieu nhap:"
		      	p "Cap Nhat Luc: #{DateTime.now.strftime('%d/%m/%Y %H:%M:%S')}"	
		        p "Trong Luong: #{current_balance} -> Tong: #{total_balance} -> Luot Can: #{count_balance}"
		        p "*******************************************************"
		        scales_input = ScalesInput.new(
	            current_balance: current_balance,
	            count_balance: count_balance,
	            total_balance: total_balance
	          )
	          if !ScalesInput.exists?(count_balance: scales_input.count_balance)
	          	scales_input.save
	          end
	        end
	      else
	      	
	      end
      end
	  end
  end

end
