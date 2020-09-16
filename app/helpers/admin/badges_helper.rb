class Admin
  module BadgesHelper
    def rules_for_select
      rules = BadgeService::RULES
      rules.map { |rule| I18n.t("rule_#{rule}", value: nil).strip }.zip(rules)
    end
  end
end
