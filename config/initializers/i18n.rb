# I18n monkey patch for localization debuging
# Original file: ~/.rvm/gems/ruby-2.7.0/gems/i18n-1.8.3/lib/i18n/backend/simple.rb

module I18n
  module Backend
    class Simple

      def lookup(locale, key, scope = [], options = EMPTY_HASH)
        init_translations unless initialized?
        keys = I18n.normalize_keys(locale, key, scope, options[:separator])

        puts "\033[35mI18N keys:\033[0m #{keys}"  if ENV['I18N_DEBUG'] # Keys

        keys.inject(translations) do |result, _key|
          return nil unless result.is_a?(Hash)
          unless result.has_key?(_key)
            _key = _key.to_s.to_sym
            return nil unless result.has_key?(_key)
          end
          result = result[_key]
          result = resolve(locale, _key, result, options.merge(:scope => nil)) if result.is_a?(Symbol)

          puts "\t\t => " + result.to_s + "\n" if ENV['I18N_DEBUG'] && result.is_a?(String) # Value

          result
        end
      end
    end
  end
end
