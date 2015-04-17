require 'aasm'

module Mdm
  class Resnetscan < Mdm::NetscannerDatabase
    include AASM

    belongs_to :cred, class_name: 'Mdm::Cred', foreign_key: :credential_id

    has_many :check_logs, class_name: 'Mdm::CheckLog'

    validates :status, presence: true

    aasm column: :status do
      state :new, initial: true
      state :connected
      state :looted
      state :error
      state :no_granted

      event :connect do
        transitions from: :new, to: :connected
      end

      event :loot do
        transitions from: :connected, to: :looted
      end

      event :error do
        transitions from: :new, to: :error
      end

      event :stop do
        transitions from: :new, to: :no_granted
      end
    end

    Metasploit::Concern.run(self)
  end
end
