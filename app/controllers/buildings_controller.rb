class BuildingsController < ApplicationController
    before_action :admin_access
    skip_before_action :admin_access, only: [:index]
    
    def index 
        @buildings = Building.all
    end 
    
    def new
        @building = Building.new
    end 
    
    def create
        @building =  Building.create(building_params) 
        #binding.pry
        if @building.save
            redirect_to @building
            
        else 
            render :new 
        end 
    end 
    
    def show
        @building = Building.find_by(params[:id])
    end 
    
    private
    
    def building_params
        params.require(:building).permit(:location_name, :address)
    end 
    
end
