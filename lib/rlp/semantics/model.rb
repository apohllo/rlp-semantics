require 'rod/model'
require 'rlp/semantics/database'

module Rlp
  module Semantics
    class Model < Rod::Model
      database_class Database
    end
  end
end
