class UrlsController < ApplicationController
    before_action :find_url, only: [:create, :sanear_url]
    
    def index
        url = Url.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded urls', data:url},status: :ok 
    end

    def create
        puts "SAIDA URL CREATE: #{urls_params[:url]}"
        puts "SAIDA URL CREATE 2: #{urls_params[:user_id]}"
        url = Url.new
        url.url =  urls_params[:url]
        url.userId = urls_params[:user_id]
        #puts "SAIDA  url.userid: #{urls_params[:user_id]}"
        
        
        if url.new_url?
            if url.save
                render json: {status: 'SUCCESS', message:'Saved urls', data:url},status: :ok
            else
                render json: {status: 'ERROR', message:'urls not saved', data:url.errors},status: :unprocessable_entity
            end
        else
            render json: {status: 'ERROR', message:'urls not saved', data:url.errors},status: :unprocessable_entity
        end                   
    end
    def show
        puts "SAIDA URL: #{urls_params[:id]}"
        url = Url.find(urls_params[:id])
        render json: {status: 'SUCCESS', message:'Loaded url', data:url},status: :ok
    end   

    def destroy
        url = Url.find(urls_params[:id])
        url.destroy
        render json: {status: 'SUCCESS', message:'Deleted urls', data:url},status: :ok
    end

    def sanear_url
        url = Url.find_by_shortUrl(urls_params[:shortUrl])
    end

    def update
        url = Url.find(urls_params[:id])
        if url.update_attributes(urls_params)
            render json: {status: 'SUCCESS', message:'Updated urls', data:url},status: :ok
        else
            render json: {status: 'ERROR', message:'urls not updated', data:url.errors},status: :unprocessable_entity
        end
    end

    private
    def find_url
        url = Url.find_by_shortUrl(urls_params[:url])
    end

    def urls_params
        params.permit(:id,:url,:user_id)
    end
    
end
