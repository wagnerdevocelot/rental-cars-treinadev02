class ManufacturersController < ApplicationController

    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturers = Manufacturer.find(params[:id])
    end

    def new
        @manufacturers = Manufacturer.new
    end

    def create
        @manufacturers = Manufacturer.new(manufacturer_params)
        @manufacturers.save
        redirect_to @manufacturers
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end


end