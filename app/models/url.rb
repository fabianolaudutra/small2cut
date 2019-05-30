class Url < ApplicationRecord
    def change
        create_table : urls do |t|
            t.integer :hits
            t.string  :url
            t.string  :shortUrl
    end
end
