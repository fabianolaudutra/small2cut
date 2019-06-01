class UsersController < ApplicationController
    def create
        #puts "SAIDA CREATE: #{users_params}"
        user = User.new(users_params)    
        if user.save
            render json: {status: 'SUCCESS', message:'Saved user', data:user},status: :ok
        else
            render json: {status: 'ERROR', message:'user not saved', data:user.errors},status: :unprocessable_entity
        end
    end
    
    def show
        #puts "SAIDA: #{users_params[:id]}"
        user = User.find(users_params[:id])
        render json: {status: 'SUCCESS', message:'Loaded user', data:user},status: :ok
    end
    
    def destroy
        #puts "SAIDA DELETE: #{users_params[:id]}"
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'Deleted user', data:user},status: :ok
        end
    
    private

    def users_params
        params.permit(:id)
    end
end
