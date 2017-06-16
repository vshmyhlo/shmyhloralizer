module Shmyhloralizer
  class Serializer < ActiveModel::Serializer
    class << self
      def group(group_name, &block)
        with_options(if: -> { group?(group_name) }, &block)
      end
    end

    def group_set
      @group_set ||= begin
        groups = [instance_options[:group]].flatten.compact
        groups.map(&:to_sym).to_set
      end
    end

    def group?(group_name)
      group_set.include?(group_name.to_sym)
    end
  end
end
