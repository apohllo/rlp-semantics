# encoding: utf-8
require 'rlp/semantics/model'
require 'rlp/grammar/text_segment'

module Rlp
  module Semantics
    class Segment < Model
      include Rlp::Grammar::TextSegment
      include Rlp::Grammar::SegmentPredicates

      field :position, :integer
      field :tags, :object

      has_one :spelling
      has_one :flexeme, :class_name => "Rlp::Grammar::Flexeme", :index => :hash

      validates :position, :numericality => {:greater_than_or_equal_to => 0}

      def to_s
        self.word_form
      end


      # Returns true if the segment is part of the semantic
      # head of the spelling, i.e. it might be inflected
      # in text.
      def part_of_head?
        return true if self.position == 0
        begin
          if self.nominal?
            # there are no non-nominal segments between given
            # segment and the beginning of its spelling
            gap = false
            self.spelling.segments.each do |prev_segment|
              break if prev_segment == self
              gap = true if !prev_segment.nominal?
            end
            !gap
          end
        rescue Exception => ex
          #puts ex
          false
        end
      end
    end
  end
end
