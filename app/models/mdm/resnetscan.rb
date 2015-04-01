require 'state_machine'
class Mdm::Resnetscan < ActiveRecord::Base
  belongs_to :workspace,
             class_name: 'Mdm::Workspace',
             inverse_of: :resnetscans

  validates :status, presence: true

  state_machine :status, initial: :new do
    event :success do
      transition new: :sussessed
    end

    event :fail do
      transition new: :failed
    end
  end

  Metasploit::Concern.run(self)
end
