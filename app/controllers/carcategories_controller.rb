class CarcategoriesController < ApplicationController

    def index
        @carcategories = CarCategory.all
    end

    def show
        @carcategories = CarCategory.find(params[:id])
    end

    def new
        @carcategory = CarCategory.new
    end

    def create
        @carcategory = CarCategory.new(carcategory_params)
        @carcategory.save
        redirect_to :url => @carcategory
    end

    private

    def carcategory_params
        params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

end
