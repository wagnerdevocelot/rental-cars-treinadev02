class RentalsController < ApplicationController
    def index
        @rentals = Rental.all
    end

    def show
        @rental = Rental.find(params[:id])
    end

    def new
        @rental = Rental.new
        @clients = Client.all
        @carcategories = CarCategory.all
    end

    def create
        @rental = Rental.new(rental_params)
        if @rental.save
            flash[:notice] = 'Locação cadastrada com Sucesso!'
            redirect_to @rental
        else
            @clients = Client.all
            @carcategories = CarCategory.all
            flash[:alert] = 'Locação não cadastrada'
            render :new
        end
    end

    def edit
        @rental = Rental.find(params[:id])
        @clients = Client.all
        @carcategories = CarCategory.all
    end

    def update
        @rental = Rental.find(params[:id])
        if @rental.update(rental_params)
            redirect_to @rental
        else
            @clients = Client.all
            @carcategories = CarCategory.all
            render :edit
        end
    end

    def destroy
        @rental = Rental.find(params[:id])
        @rental.destroy
        redirect_to @rental, notice: "Locação excluida com Sucesso!"
    end

private

    def rental_params
       params.require(:rental).permit(:start_date, :end_date, :client_id, :car_category_id)
    end

end