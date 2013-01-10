class Posaas::Order < ActiveResource::Base
  self.site = Posaas::Base.service_url
  self.format = :json
end