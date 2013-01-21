class ShoppingController < ApplicationController

	def shopping_cart

	end

	def add
		if params[:shopping]	

			if session[:shopping_cart]
				_cart = Hash.new
				_cart[:item] = params[:item]
				_cart[:price] = params[:price]
				_cart[:quantity] = params[:quantity]
				_cart[:item_type] = params[:item_type]
				session[:shopping_cart][session[:shopping_cart].length] = _cart
			else
				session[:shopping_cart] = Array.new
				_cart = Hash.new
				_cart[:item] = params[:item]
				_cart[:price] = params[:price]
				_cart[:quantity] = params[:quantity]
				_cart[:item_type] = params[:item_type]
				session[:shopping_cart][0] = _cart
				
			end

			redirect_to '/shopping_cart'
		end
	end 


	def shopping_checkout

	end

end