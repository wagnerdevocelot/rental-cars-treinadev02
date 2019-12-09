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
        @carcategory = CarCategory.new(category_params)
        if @carcategory.save
            redirect_to @carcategory, notice:"Categoria cadastrada com sucesso!"
        else
            render :new
        end
    end

    def edit
        @carcategory = CarCategory.find(params[:id])
    end

    def update
        @carcategory = CarCategory.find(params[:id])
        if @carcategory.update(category_params) 
            redirect_to @carcategory, notice:"Categoria editada com sucesso!"
        else
            render :edit
        end
    end

    def destroy
        @carcategory = CarCategory.find(params[:id])
        @carcategory.destroy
        redirect_to @carcategory
    end


private

    def category_params
       params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

end


