puts 'loading posaas gem ...'

require "posaas/version"
require 'posaas/engine'

module Posaas
  class Base
    class << self; attr_accessor :service_url end
    @service_url = "http://localhost:3000"
  end
end

