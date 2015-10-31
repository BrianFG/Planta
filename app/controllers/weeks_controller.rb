class WeeksController < ApplicationController
  def index
  	@weeks = Sale.joins(:day).group("CONCAT(fecha, ' - ', fecha + INTERVAL 6 DAY)").sum("(precio+envio)*cantidad ")
  end

  def show
  end
end
