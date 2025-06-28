module RailsApiGuard
    module Services
        class ExclusionChecker
            def self.excluded_endpoint?(path)
                return true if path.start_with?('/.well-known')

                RailsApiGuard.config.excluded_patterns.any? do |pattern|
                    if pattern.start_with?("^")
                        Regexp.new(pattern).match?(path)
                    else
                        File.fnmatch?(pattern, path)
                    end
                end
            end
        end
    end
end