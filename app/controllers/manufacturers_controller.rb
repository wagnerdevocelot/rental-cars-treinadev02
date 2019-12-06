class ManufacturersController < ApplicationController
    before_action :authenticate_user!

    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturer = Manufacturer.find(params[:id])
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save
            redirect_to @manufacturer, notice:"Fabricante cadastrado com sucesso!"
        else
            render :new
        end
    end


    def edit
        @manufacturer = Manufacturer.find(params[:id])
    end

    def update
        @manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.update(manufacturer_params)
            redirect_to @manufacturer, notice:"Fabricante editado com sucesso!"
        else
            render :edit
        end
    end


    def destroy
        @manufacturer = Manufacturer.find(params[:id])
        @manufacturer.destroy
        redirect_to @manufacturer
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end


end