class ClientsController < ApplicationController
    
    before_action :authenticate_user!


    def index
        @clients = Client.all
    end

    def show
        @client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client, notice:"Cliente cadastrado com sucesso!"
        else
            render :new
        end
    end


    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find(params[:id])
        if @client.update(client_params)
            redirect_to @client, notice:"Cliente editado com sucesso!"
        else
            render :edit
        end
    end


    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to @client, notice: "Cliente excluido com Sucesso!"
    end

    private

    def client_params
        params.require(:client).permit(:name, :cpf, :email)
    end

end