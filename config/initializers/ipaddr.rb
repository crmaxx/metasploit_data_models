module IPAddrExtensions
  extend ActiveSupport::Concern
  included do
    begin
      remove_method :==
    rescue NameError => e
      puts e.message
    end

    alias_method :spaceship_without_rescue, :<=>
    alias_method :<=>, :spaceship_with_rescue

    alias_method_chain :include?, :rescue
  end

  def spaceship_with_rescue(other)
    spaceship_without_rescue(other)
  rescue ArgumentError
    false
  end

  def include_with_rescue?(other)
    include_without_rescue?(other)
  rescue ArgumentError
    false
  end
end

IPAddr.send(:include, IPAddrExtensions)
