class CarsController < ApplicationController


    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
    end

    def new
        @car = Car.new
        @subsidiaries = Subsidiary.all
        @carmodels = CarModel.all
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            flash[:notice] = 'Carro cadastrado com sucesso'
            redirect_to @car
        else
            @subsidiaries = Subsidiary.all
            @carmodels = CarModel.all
            flash[:alert] = 'Algo deu errado'
            render :new
        end
    end

    def edit
        @car = Car.find(params[:id])
        @subsidiaries = Subsidiary.all
        @carmodels = CarModel.all
    end

    def update
        @car = Car.find(params[:id])
        if @car.update(car_params)
            redirect_to @car, notice:"Carro editado com sucesso!"
        else 
            render :edit
            @subsidiaries = Subsidiary.all
            @carmodels = CarModel.all
        end
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        redirect_to @car, notice:"Carro deletado com sucesso!"
    end


private

    def car_params
       params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
    end

end


