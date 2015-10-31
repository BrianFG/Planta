class CalendarController < ApplicationController
  def index
  	@days = Day.all	 
  end

  def events
  	  	@mymodel = Day.all.map { |r| 
  	  		
  	  		garrafones = r.sales.where("container_id = ?",1).sum(:cantidad).to_s
  	  		g11 = r.sales.where("container_id = ?",2).sum(:cantidad).to_s
  	  		otros = r.sales.where("container_id != ?" , 1).sum(:cantidad).to_s
  	  		venta = r.sales.sum("(precio+envio)*cantidad").to_s
  	  		{:title => garrafones + " Garrafones 20L\n" + g11 + " Garrafones 11L\n" + otros  + " Otros\n\nVenta: $" + venta,
  	  		 :start => r.fecha,
  	  		 :color => '#66FF33', 
  	  		 :end => r.fecha, 
  	  		 :id => r.id,
  	  		 :backgroundColor => "#3498db"} 

  	  		} 

		respond_to do |format|
		    format.html
		    format.json { render :json => @mymodel }

	  	end

	end



end
