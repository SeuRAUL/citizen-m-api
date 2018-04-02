module Api
    module V1
        class CitizensController < ApplicationController
            
            # List all citizens
            def index
               citizens = Citizens.order('created_at DESC');
               render json: {status: 'SUCCESS', message:'Citizens loaded', data:citizens}, status: :ok
            end
            
        end
    end
end