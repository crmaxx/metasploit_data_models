require 'state_machine'

class Mdm::Job < ActiveRecord::Base
  belongs_to :workspace,
             class_name: 'Mdm::Workspace',
             inverse_of: :jobs

  has_and_belongs_to_many :creds, class_name: 'Mdm::Cred'
  has_and_belongs_to_many :resnetscans, class_name: 'Mdm::Resnetscan'

  scope :ready_to_start, -> { where(status: "new") }

  validates :name, presence: true
  validates :status, presence: true

  state_machine :status, initial: :new do
    event :start do
      transition new: :in_progress
    end

    event :success do
      transition [:new, :in_progress] => :sussessed
    end

    event :error do
      transition [:new, :in_progress] => :error
    end
  end

  Metasploit::Concern.run(self)
end
