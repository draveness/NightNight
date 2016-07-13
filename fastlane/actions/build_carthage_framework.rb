module Fastlane
  module Actions
    module SharedValues
      CARTHAGE_FRAMEWORK = :CARTHAGE_FRAMEWORK
    end

    class BuildCarthageFrameworkAction < Action
      def self.run(params)
        Actions.sh("carthage build --no-skip-current")
        Actions.sh("carthage archive #{params[:framework_name]}")

        path = "#{params[:framework_name]}.framework.zip"

        Actions.lane_context[SharedValues::CARTHAGE_FRAMEWORK] = path

        Helper.log.info "Carthage generated #{params[:framework_name]}.framework"

        return path
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Build and archive a Framework project using Carthage"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
          [
              FastlaneCore::ConfigItem.new(key: :framework_name,
                                           env_name: "CARTHAGE_FRAMEWORK_NAME", # The name of the environment variable
                                           description: "The name of the framework for Carthage to generate", # a short description of this parameter
                                           is_string:true)
          ]
      end

      def self.output
          [
              ['CARTHAGE_FRAMEWORK', 'The path to the generate Carthage framework']
          ]
      end

      def self.return_value
          "The path to the zipped framework"
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
          return true
      end
    end
  end
end
