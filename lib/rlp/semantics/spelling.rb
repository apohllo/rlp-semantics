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

      # Returns true if the spelling seems to be a name.
      def name?
        # If count == 1 it is really hard to tell - should be verified
        # statistically.
        case self.segments.count
        when 1
          true
        when 2
          self.segments[0].first_capital? &&
            self.segments[1].first_capital?
        else
          self.segments[0].first_capital? &&
            (self.segments[1].first_capital? ||
             self.segments[2].first_capital?)
        end
      end
    end
  end
end
