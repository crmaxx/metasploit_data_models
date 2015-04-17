module Mdm
  class NetscannerDatabase < ActiveRecord::Base
    self.abstract_class = true
    establish_connection "netscanner_#{Rails.env}".to_sym
  end
end
