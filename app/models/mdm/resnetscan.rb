require 'state_machine'

class Mdm::Resnetscan < ActiveRecord::Base
  belongs_to :workspace, class_name: 'Mdm::Workspace'
  belongs_to :cred, class_name: 'Mdm::Cred'

  validates :status, presence: true

  state_machine :status, initial: :new do
    event :connect do
      transition new: :connected
    end

    event :loot do
      transition connected: :looted
    end

    event :error do
      transition new: :error
    end
  end

  Metasploit::Concern.run(self)
end
