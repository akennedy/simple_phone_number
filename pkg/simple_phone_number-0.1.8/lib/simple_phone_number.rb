module SimplePhoneNumber

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods      
    attr_accessor :phone_number_attributes
    
    def simple_phone_number(*args)
      @phone_number_attributes = [] unless @phone_number_attributes.is_a? Array
      
      options     = args.extract_options!
      attributes  = args
      attributes << :phone_number if attributes.empty?
      
      unless options[:validate] === false
        validates_simple_phone_number attributes, options
      end
      
      attributes.each do |attribute|
        define_method "#{attribute}=" do |value|
          phone = value.gsub(/^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, '\1-\2-\3')
          write_attribute(attribute, phone)
        end

        @phone_number_attributes << attribute
      end
    
      include SimplePhoneNumber::InstanceMethods
    end
  
    def phone_number_attributes
      Array(@phone_number_attributes)
    end

    def validates_simple_phone_number(*args)
      options     = clean_simple_phone_number_options(args.extract_options!)
      message     = options.delete(:message)
      attributes  = args
    
      validates_each attributes, options do |record, attr_name, value|
        record.errors.add attr_name, message || 'should look like 1234567890, 123-456-7890, 123.456.7890, 123 456 7890 or (123) 456 7890' unless record[attr_name] =~ /^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
      end
    end
    
    private
    def clean_simple_phone_number_options(options = {})
      options.inject({}) do |opts, (key, value)|
        opts[key.to_s.sub(/^validat(es?|ion)_/, '').to_sym] = value
        opts
      end
    end
  end

  module InstanceMethods
    def phone_numbers
      self.class.phone_number_attributes.map {|a| [a, read_attribute(a)]}
    end
  end
end

ActiveRecord::Base.send(:include, SimplePhoneNumber)
