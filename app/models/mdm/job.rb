require 'aasm'

module Mdm
  class Job < Mdm::NetscannerDatabase
    include AASM

    has_many :check_logs, class_name: 'Mdm::CheckLog'

    has_many :credentials_jobs, class_name: 'Mdm::CredentialsJob'
    has_many :creds, through: :credentials_jobs, class_name: 'Mdm::Cred'

    has_many :jobs_resnetscan, class_name: 'Mdm::JobsResnetscan'
    has_many :resnetscans, through: :jobs_resnetscan, class_name: 'Mdm::Resnetscan'

    scope :ready_to_start, -> { where(status: :new) }

    validates :name, presence: true
    validates :status, presence: true

    aasm column: :status do
      state :new, initial: true
      state :in_progress
      state :successed
      state :error

      event :start do
        transitions from: :new, to: :in_progress
      end

      event :success do
        transitions from: [:new, :in_progress], to: :successed
      end

      event :error do
        transitions from: [:new, :in_progress], to: :error
      end
    end

    Metasploit::Concern.run(self)
  end
end
