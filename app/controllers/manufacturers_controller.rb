class ManufacturersController < ApplicationController

    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturers = Manufacturer.find(params[:id])
    end

end