module Mdm
  # class CredentialsJob < ActiveRecord::Base
  #   belongs_to :cred
  #   belongs_to :job
  # end
  class CredentialsJob < ActiveRecord::Base
    belongs_to :cred, foreign_key: :credential_id
    belongs_to :job
  end
end
