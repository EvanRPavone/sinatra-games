class User < ActiveRecord::Base
    has_secure_password
    validates :username, :presence => true
    has_many :reviews


    def self.find_by_slug(slug)
        User.all.find {|user| user.slug == slug}
    end
    
    def slug
        username.downcase.gsub(" ", "-")
    end

end