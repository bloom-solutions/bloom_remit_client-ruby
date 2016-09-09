# frozen_string_literal: true
module BloomRemitClient
  module Coercers
    class Path < Virtus::Attribute
      def coerce(value)
        return value if !value.is_a?(String) || value[0] == '/'
        "/#{value}"
      end
    end
  end
end
