require "shmyhloralizer/version"

class Shmyhloralizer < ActiveModel::Serializer
  class << self
    def group(group_name, &block)
      with_options(if: -> { group?(group_name) }, &block)
    end
  end

  def group?(group_name)
    instance_options[:group] &&
      instance_options[:group].to_sym == group_name.to_sym
  end
end
