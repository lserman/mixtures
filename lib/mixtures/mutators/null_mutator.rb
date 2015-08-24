module Mixtures
  class NullMutator < Mutator

    def mutate
      @attr
    end

    def self.should_mutate?(*)
      false
    end

  end
end