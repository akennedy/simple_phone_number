# SimplePhoneNumber

## Install
 
    gem install simple_phone_number

## Example

  SimplePhoneNumber will accept the following phone formats:
  1234567890, 123-456-7890, 123.456.7890, 123 456 7890 and (123) 456 7890
  
  and save the record in 123-456-7890 format
   
    class User < ActiveRecord::Base
      simple_phone_number :home_phone, :cell_phone
    end

## Options
  

    simple_phone_number :home_phone, :validate => false, :allow_blank => true
    simple_phone_number :home_phone, :validate_on => :update, :validate_if => proc{|record| record.something?}
    simple_phone_number :home_phone, :validation_message => "should look like 1234567890, 123-456-7890, 123.456.7890, 123 456 7890 or (123) 456 7890"

  Also,

    validates_simple_phone_number :cell_phone, :if => proc{|record| record.home_phone.blank?}