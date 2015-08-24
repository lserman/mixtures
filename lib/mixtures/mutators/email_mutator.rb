module Mixtures
  class EmailMutator < Mutator

    def mutate
      "#{SecureRandom.hex}@#{SecureRandom.hex}.com"
    end

    def self.should_mutate?(record, attr)
      attr =~ /email/
    end

  end
end