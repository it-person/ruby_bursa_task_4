module Library
	module Identifier
		
		def self.included(base)
			base.send :class_variable_set, :@@group_identifier, 0
			base.send :extend, ClassMethods
			base.send :prepend, Initializer
		end		
		
		module ClassMethods

      def inc_ident_or_init
        self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + 1
      end

    end

    module Initializer
      def initialize *args
        @identifier = self.class.inc_ident_or_init
        super *args
      end
    end

    def identifier
    	@identifier
    end

    def eql? other
    	@identifier == other.identifier
    end
		
    def == other
    	@identifier == other.identifier
    end
	end
end