require 'state_machine'

class Mdm::Resnetscan < ActiveRecord::Base
  belongs_to :workspace, class_name: 'Mdm::Workspace'
  belongs_to :cred, class_name: 'Mdm::Cred'

  has_many :check_logs, class_name: 'Mdm::CheckLog'

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

    event :stop do
      transition new: :no_granted
    end
  end

  Metasploit::Concern.run(self)
end
