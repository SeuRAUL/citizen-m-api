module Api
    module V1
        class CitizensController < ApplicationController
            
            # List all citizens
            def index
               citizens = Citizen.order('created_at DESC');
               render json: citizens, include: ['mutation_flags']
            end
            
            # List citizen by ID
			def show
				citizen = Citizen.find(params[:id])
				render json: citizen, include: ['mutation_flags']
			end
			
			# Create new citizen
			def create
				citizen = Citizen.new(citizen_params)
				if citizen.save
					render json: {status: 'SUCCESS', message:'Saved citizen', data:citizen}, status: :ok
				else
					render json: {status: 'ERROR', message:'Citizens not saved', data:citizen.erros}, status: :unprocessable_entity
				end
			end
			
			# Update last location
			def update
				citizen = Citizen.find(params[:id])
				if !citizen.mutant and citizen.update_attributes(citizen_params)
					render json: {status: 'SUCCESS', message:'Updated citizen', data:citizen}, status: :ok
				else
					render json: {status: 'ERROR', message:'Citizen not updated', data:citizen.erros}, status: :unprocessable_entity
				end
			end
			
			# Permited Params
			private
			def citizen_params
				params.permit(:name, :age, :gender, :lastLocation, mutation_flags_attributes: [:id, :flag, :mutation])
			end
			
			def citizen_update_params
				params.permit(:lastLocation)
			end
            
        end
    end
end