module Mixtures
  module Mixin

    def mutate(fixture, *attributes)
      record = fixture.dup
      options = attributes.extract_options!

      record = mutate_with_mutator(record, attributes)
      record = mutate_with_direct_values(record, options)

      yield record if block_given?
      record.tap(&:save)
    end

    private

      def mutate_with_mutator(record, attributes)
        attributes.each do |attr|
          mutator = find_mutator(record, attr)
          record.send "#{attr}=", mutator.mutate
        end
        record
      end

      def mutate_with_direct_values(record, options)
        options.each do |attr, value|
          record.send "#{attr}=", value
        end
        record
      end

      def find_mutator(record, attr)
        mutators = Mixtures.mutators
        mutator = mutators.find { |m| m.should_mutate? record, attr }
        (mutator || NullMutator).new(attr)
      end

  end
end