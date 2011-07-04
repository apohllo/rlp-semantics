#encoding: utf-8
require 'rlp/semantics/model'

module Rlp
  module Semantics
    # This class represents one spelling of given +concept+. A spelling
    # is a natural language (Polish) realization of given concept.
    class Spelling < Model
      has_one :concept
      has_many :segments

      validates_presence_of :segments, :concept

      def to_s
        segments.to_a.join(" ")
      end
    end
  end
end
