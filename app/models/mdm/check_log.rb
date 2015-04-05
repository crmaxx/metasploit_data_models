class Mdm::CheckLog < ActiveRecord::Base
  belongs_to :workspace,
             class_name: 'Mdm::Workspace',
             inverse_of: :check_logs

  belongs_to :job,
             class_name: 'Mdm::Job',
             inverse_of: :check_logs

  belongs_to :resnetscan,
             class_name: 'Mdm::Resnetscan',
             inverse_of: :check_logs

  Metasploit::Concern.run(self)
end
