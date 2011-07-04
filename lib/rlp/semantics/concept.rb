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
      field :name, :string, :index => true
      field :ssjp_id, :integer

      has_many :spellings

      validates_presence_of :spelings, :name
    end
  end
end
