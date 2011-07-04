# encoding: utf-8
require 'rlp/semantics/model'
require 'rlp/grammar/text_segment'

module Rlp
  module Semantics
    class Segment < Model
      include Rlp::Grammar::TextSegment

      field :position, :integer
      field :tags, :object

      has_one :spelling
      has_one :flexeme, :class_name => "Rlp::Grammar::Flexeme"

      validates :position, :numericality => {:greater_than_or_equal_to => 0}

    end
  end
end
