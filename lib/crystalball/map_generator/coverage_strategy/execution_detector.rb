# frozen_string_literal: true

require_relative '../helpers/path_filter'

module Crystalball
  class MapGenerator
    class CoverageStrategy
      # Class for detecting code execution path based on coverage information diff
      class ExecutionDetector
        include ::Crystalball::MapGenerator::Helpers::PathFilter
        # Detects files affected during example execution. Transforms absolute paths to relative.
        # Exclude paths outside of repository
        #
        # @param[Array<String>] list of files affected before example execution
        # @param[Array<String>] list of files affected after example execution
        # @return [Array<String>]
        def detect(before, after)
          filter after.reject { |file_name, after_coverage| before[file_name] == after_coverage }.keys
        end
      end
    end
  end
end
