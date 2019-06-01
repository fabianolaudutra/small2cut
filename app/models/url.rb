class Url < ApplicationRecord
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
         puts "SAIDA create url: #{url}"
         puts "SAIDA create old: #{url_old}"
         if url_old.present?
             self.create_short_url
         else
             self.shortUrl = url
         end
     end

     def find_duplicate
         puts "SAIDA URL sanear: #{self.url}"
         puts "SAIDA URL sanear 2: #{ Url.find_by_sanear(self.sanear).inspect}"
         Url.find_by_sanear(self.sanear)        
    end
  
     def new_url?
         find_duplicate.nil?
     end
    
    
    def sanear
        puts "SAIDA URL CREATE: #{self.url}"
        self.url.strip!
        sanear_ret = self.url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
        self.sanear = "http://#{sanear_ret}"
    end

end
