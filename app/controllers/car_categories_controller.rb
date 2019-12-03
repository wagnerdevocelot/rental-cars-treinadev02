class CarCategoriesController < ApplicationController
    def index
        @carcategories = CarCategory.all
    end

    def show
        @carcategory = CarCategory.find(params[:id])
    end

    def new
        @carcategory = CarCategory.new
    end

    def create
        @carcategory = CarCategory.create(category_params)
        redirect_to @carcategory
    end


private

    def category_params
       params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

end


