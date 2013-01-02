class Commit

  extend  ActiveModel::Naming
  include ActiveModel::Serialization

  attr_accessor :branch,
                :comment,
                :committer,
                :date,
                :diff,
                :repository,
                :revision

  def initialize( attributes )

    attributes.each_pair do |key, val|
      instance_variable_set( "@#{key.to_s}", val )
    end

  end

end
