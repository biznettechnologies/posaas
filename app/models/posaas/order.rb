class Posaas::Order < ActiveResource::Base
  self.site = Posaas::Base.service_url
  self.format = :json
  self.include_root_in_json = true
end
