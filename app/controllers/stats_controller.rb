class StatsController < ApplicationController
    def index        
        #url = Url.order('created_at DESC');
        data = {}
          data[:htis] = 'teste'
          data[:urlCount] = 'teste'
          data[:topUrls] = ['id':'teste','teste2':'teste2']
         
        render json: data 
    end
end