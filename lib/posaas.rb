puts 'loading posaas ...'

require "posaas/version"

module Posaas
  class Base
    class << self; attr_accessor :service_url end
    @service_url = "http://localhost:3000"
  end
end

# require 'posaas/engine'
