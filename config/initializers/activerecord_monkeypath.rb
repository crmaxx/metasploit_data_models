module ActiveRecord
  module Scoping
    module Named
      extend ActiveSupport::Concern
      module ClassMethods
        def scoped(options = nil)
          if options
            scoped.apply_finder_options(options)
          else
            if current_scope
              current_scope.clone
            else
              relation
            end
          end
        end
      end
    end
  end
end
