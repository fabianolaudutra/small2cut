class Url < ApplicationRecord
    require 'net/http'
    require 'uri'
    require 'json'
    require 'socket'
    #require 'request'    
    UNIQUE_LENGTH= 8
    self.primary_key = "id"
    #belongs_to :user
    validates :url, presence:true, on: :create
    validates_format_of :url,
        with: /\A(?:(http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
    before_create :create_short_url
    before_create :sanear
    
    
     def create_short_url
         url = ([*('a'..'z'),*('0'..'9')]).sample(UNIQUE_LENGTH).join
         url_old = Url.where(url: shortUrl).last
         if url_old.present?
             self.create_short_url
         else
             self.shortUrl = url
         end
     end

    def find_duplicate
         Url.find_by_url(self.url)        
    end
   
    def new_url?
         find_duplicate.nil?
    end
     
    def sanear
        uri   = URI(self.url)
        
        puts "SAIDA t: #{ @host_and_port}"
        #hostname = request.original_url#Socket.gethostname
        hostname = Socket.gethostname
        host  = URI.parse(self.url).host
        port  = URI.parse(self.url).port
        self.url.strip!
        sanear_ret = self.url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
        self.sanear = "http:// #{sanear_ret} [:#{port}]/#{self.shortUrl}"
    end

end
