class PortfoliosController < ApplicationController
	
	def index
		@portfolio_item = Portfolio.all
	end

	def angular
		@angular_portfolio_item = Portfolio.angular
	end
	
	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :body))	
		respond_to do |format|
		  if @portfolio_item.save
			format.html { redirect_to new_portfolio_path, notice: 'Portfolio was successfully created.' }
		  else
			format.html { render :new }
		  end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])
		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title,:body))
				format.html { redirect_to portfolio_update_patch_path, notice: 'The record was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])
	end

	def destroy
		@portfolio_item = Portfolio.find(params[:id])
		@portfolio_item.destroy
		respond_to do |format|
		  format.html { redirect_to portfolio_destroy_path, notice: 'The record was successfully destroyed.' }
		end
	  end

 end