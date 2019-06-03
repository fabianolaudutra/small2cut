class UrlsController < ApplicationController
    before_action :find_url, only: [:create, :sanear_url]
    
    def index
        url = Url.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded urls', data:url},status: :ok 
    end

    def create
        #puts "SAIDA URL CREATE 2: #{urls_params[:user_id]}"
        url = Url.new
        url.url =  urls_params[:url]
        url.userId = urls_params[:user_id]
        url.hits = 1;              
        if url.new_url?
            if url.save
            data = {}
            data[:id] = url['id']
            data[:hits] = url['hits']
            data[:url] = url['url']
            data[:shortUrl] = url['sanear']
                            
            render json: data              
            else
                render json: {status: 'ERROR', message:'urls not saved', data:url.errors},status: :unprocessable_entity
            end
        else
            data = {}
            data[:hits] = add_hits
            data[:message] = '301 Redirect'
            data[:Location] = url[:url]
            render json: data  
        end 
                         
    end
    def show
        url = Url.find(urls_params[:id])
        puts "url.nil?: #{url.nil?}"
            rescue ActiveRecord::RecordNotFound => e        
        
            unless url.nil?
                data = {}
                data[:message] = '301 Redirect'
                data[:Location] = url[:url]
                render json: data    
            else
                data = {}
                data[:message] = '404 Not Found.'
                render json: data           
            end
       
    end    

    def destroy
        puts "SAIDA URL: #{urls_params[:id]}"
        url = Url.find(urls_params[:id])
        url.destroy
        data = {}
        render json: data
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
    def add_hits
        count_hist = Url.find_by_url(urls_params[:url])
        retUrl = count_hist[:url]
        retHits =  count_hist[:hits]
        puts "SAIDA count_hist: #{count_hist.inspect}"
        puts "SAIDA @hits.inspect: #{retUrl}"
        puts "SAIDA @hits.inspect 2: #{count_hist[:url]}"    
        puts "SAIDA @hits.inspect 3: #{retHits}"

        if retUrl == count_hist[:url]
            retHits =  retHits.to_i + 1  
            count_hist.update_attributes(hits: retHits) 
        else
            retHits = retHits
            count_hist.update_attributes(hits: retHits) 
        end
        puts "SAIDA return: #{retHits}"
        return retHits    
    end

    private
    def find_url
        url = Url.find_by_shortUrl(urls_params[:url])
    end
    
    def urls_params
        params.permit(:id,:url,:user_id)
    end
    
end
