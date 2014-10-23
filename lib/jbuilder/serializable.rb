require 'jbuilder'

module Jbuilder::Serializable
  module ViewHelpers
    def serialize! key, resource, options = {}
      if options.empty? && resource.is_a?(Hash)
        options, resource, key = resource, key, nil
      end

      serializer = options.fetch(:serializer, ActiveModel::Serializer.serializer_for(resource))
      return _set_value(key, nil) unless serializer

      serializer_instance = serializer.new(resource, options.merge(root: false))

      if key.nil?
        if options[:cache]
          cache! serializer_instance.cache_key do
            merge! serializer_instance.as_json
          end
        else
          merge! serializer_instance.as_json
        end
      else
        _set_value key, serializer_instance.as_json
      end
    end
  end
end

Jbuilder.__send__ :include, Jbuilder::Serializable::ViewHelpers

