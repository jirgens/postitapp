class CategoriesController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update]
	#before_action :require_user, except: [:index. :show]

	def index
		@categories = Category.all
	end

	def show; end

	def new
		@category = Category.new
		require_user(:new, 'create a category')
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = 'Your category was saved.'
			redirect_to category_path(@category)
		else
			render :new
		end
	end

	def edit
		require_user(:edit, 'edit this category')
	end

	def update

		if @category.update(category_params)
			flash[:notice] = 'Your category was updated'
			redirect_to category_path(@category)
		else
			render :edit
		end
	end

	private

		def category_params
			params.require(:category).permit!
		end

		def set_category
			@category = Category.find(params[:id])
		end

	end