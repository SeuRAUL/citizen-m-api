module Api
    module V1
        class CitizensController < ApplicationController
            
            # List all citizens
            def index
               citizens = Citizen.order('created_at DESC');
               render json: {status: 'SUCCESS', message:'Citizens loaded', data:citizens}, status: :ok
            end
            
            # List citizen by ID
			def show
				citizen = Citizen.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded citizen', data:citizen}, status: :ok
			end
            
        end
    end
end