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

      # TODO this is very rough implementation!!!
      def head
        unless defined?(@head)
          begin
            @head = self.segments.find{|s| s.noun? && s.nominal?} || self.segments.first
          rescue Rlp::Grammar::RlpException
            @head = self.segments.first
          end
          def @head.flexeme
            return @flexeme if defined?(@flexeme)
            if self.flexemes.count == 0
              @flexeme = Rlp::Grammar::Flexeme::Invariable.new
              @flexeme.lemma = self.form.value
              @flexeme.word_forms << self.form
              def @flexeme.values_for(form)
                [[]]
              end
            # TODO determine it somehow
            else
              @flexeme = self.flexemes.first
            end
            @flexeme
          end
        end
        @head
      end
    end
  end
end
