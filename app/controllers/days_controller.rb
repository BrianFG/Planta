class DaysController < ApplicationController
  def index
  	@days = Day.all
  	@g20 = Sale.all.where(container_id: 1).sum(:cantidad)
    @g11 = Sale.all.where(container_id: 2).sum(:cantidad)
    @otros = Sale.all.where("container_id != ? and container_id != ?", 1, 2 ).sum(:cantidad)
    @total = Sale.all.sum("cantidad * precio")
    @envio = Sale.all.sum("cantidad * envio")
  end

  def show
  	@day = Day.find(params[:id])
  	@sales = @day.sales
  end

  def new
  	@day = Day.new
  	a = params[:cant]
    a.to_i.times { @day.sales.build }
  end

  def create
  	@day = Day.new(day_params)
  	if @day.save
  		redirect_to '/days'
  	else
  		render 'new'
  	end 
  end

  private
  def day_params
    params.require(:day).permit(:fecha, sales_attributes: [:cantidad, :precio, :envio, :hora, :container_id])
  end

end
