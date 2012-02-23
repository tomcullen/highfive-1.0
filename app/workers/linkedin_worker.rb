#Put this in the terminal to run redis: redis-server /usr/local/etc/redis.conf
#Put this in the terminal to run resque:  rake resque:work QUEUE='*'
#to bring up the redis web server type this in the terminal:   resque-web

class LinkedinWorker
  @queue = :populate_linkedin_contacts

  def self.perform(current_user_id)
    # User.create(firstname: "Luis#{current_user_id}", lastname: "Vega", password: "codecloud", password_confirmation: "codecloud", email: "luis@vega.com")
    if user = User.find(current_user_id)
      client = LinkedIn::Client.new("54biq7g6ggjo", "hPbyUdevmHxqvGup")
      client.authorize_from_access(user.atoken, user.asecret)
      client.connections.all.each do |connection|
        if connection["id"] != "private"
          id = connection["id"]
          profile = client.profile(id: id)
          positions = client.profile(id: id, fields: ["positions"])["positions"].all rescue nil
          title = positions.first.title rescue ""
          company = positions.first.company.name rescue ""
          industry = positions.first.company.industry rescue ""
          contact = user.contacts.create(firstname: profile.first_name, lastname: profile.last_name, jobtitle: title, state: "d")
          if contact.save && !company.nil?
            if Company.find_by_companyname(company)
              company1 = Company.find_by_companyname(company)
            else
              company1 = Company.create :companyname => company, :industry => (industry rescue nil)
            end

            my_firm = Myfirm.create user_id: user.id, :company_id => company1.id
            Contactcompanyjoin.create contact_id: contact.id, :company_id => company1.id
          end
        end    
      end
    else
      redirect_to new_user_url, notice: "User not found."
    end
  end
  
end