require 'aasm'

module Mdm
  class Job < Mdm::NetscannerDatabase
    include AASM

    has_many :check_logs, class_name: 'Mdm::CheckLog'

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
