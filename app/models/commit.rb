class Commit < ActiveRecord::Base

  def initialize( attributes )

    attributes.each_pair do |key, val|
      instance_variable_set( "@#{key.to_s}", val )
    end

  end

end
