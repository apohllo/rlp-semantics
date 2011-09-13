# encoding: utf-8
require 'rlp/semantics/model'

module Rlp
  module Semantics
    # The class representing concepts in semantics. These could be
    # instances and collections according to OWL definitions.
    # So far their meaning is reduced to the name and a set
    # of +spellings+, that is textual realizations of these concepts in
    # the Polish language. Since one concept might be expressend in many
    # ways, one concept has many spellings.
    class Concept < Model
      # The descriptive name of the concept.
      field :name, :string, :index => :hash

      # The SSJP DB id of the concept.
      field :ssjp_id, :integer, :index => :hash

      # Spellings, i.e. text representations of the concept, split into
      # segments which are mapped to RLP flexemes.
      has_many :spellings

      # Direct children of the concept - its specialisations.
      has_many :children, :class_name => "Rlp::Semantics::Concept"

      # Direct parents of the concept - its generalisations.
      has_many :parents, :class_name => "Rlp::Semantics::Concept"

      validates_presence_of :name, :ssjp_id

      # String representation of the concept.
      def to_s
        self.name
      end
    end
  end
end
