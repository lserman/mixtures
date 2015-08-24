require 'active_support/core_ext/module/attribute_accessors'

require 'mixtures/version'
require 'mixtures/mixin'

module Mixtures
  mattr_accessor :mutators
  self.mutators = []
end

require 'mixtures/mutators/mutator'
require 'mixtures/mutators/email_mutator'
require 'mixtures/mutators/null_mutator'
