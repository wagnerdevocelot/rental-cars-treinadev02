class CarModelsController < ApplicationController
    def index
        @carmodels = CarModel.all
    end

    def show
        @carmodel = CarModel.find(params[:id])
        @carcategories = CarCategory.all
        @manufacturers = Manufacturer.all
    end

    def new
        @carmodel = CarModel.new
        @carcategories = CarCategory.all
        @manufacturers = Manufacturer.all
    end

    def create
        @carmodel = CarModel.new(carmodel_params)
        if @carmodel.save
            redirect_to @carmodel, notice:"Modelo cadastrado com sucesso!"
        else
            @carcategories = CarCategory.all
            @manufacturers = Manufacturer.all
            render :new
        end
    end

    def edit
        @carmodel = CarModel.find(params[:id])
        @carcategories = CarCategory.all
        @manufacturers = Manufacturer.all
    end

    def update
        @carmodel = CarModel.find(params[:id])
        if @carmodel.update(carmodel_params) 
            redirect_to @carmodel, notice:"Modelo editado com sucesso!"
        else
            @carcategories = CarCategory.all
            @manufacturers = Manufacturer.all
            render :edit
        end
    end

    def destroy
        @carmodel = CarModel.find(params[:id])
        @carmodel.destroy
        redirect_to @carmodel
    end


private

    def carmodel_params
       params.require(:car_model).permit(
           :name, 
           :year, 
           :manufacturer_id, 
           :motorization, 
           :car_category_id, 
           :fuel_type
        )
    end


end
