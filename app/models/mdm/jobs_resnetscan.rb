module Mdm
  class JobsResnetscan < Mdm::NetscannerDatabase
    self.table_name = "hosts_jobs"

    belongs_to :job
    belongs_to :resnetscan, foreign_key: :host_id
  end
end
