class Admin
  module BadgesHelper
    def rules_for_select
      Badge::RULES.collect { |key, value| [value, key] }
    end
  end
end
