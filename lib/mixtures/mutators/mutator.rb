module Mixtures
  class Mutator

    def initialize(attr)
      @attr = attr.to_s
    end

    def self.inherited(base)
      Mixtures.mutators << base
    end

  end
end