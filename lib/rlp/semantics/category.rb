# encoding: utf-8
require 'rlp/semantics/model'

module Rlp
  module Semantics
    # This class represents Umbel super types, which are broad
    # and almost partitioning categorisations of concepts.
    class Category < Model
      # The name of the category.
      field :name, :string, :index => :hash

      # Category has many concepts belonging to it.
      has_many :concepts

      validates_presence_of :name

      # String representation of the category.
      def to_s
        self.name
      end
    end
  end
end
