module Fastlane
  module Actions
    module SharedValues
      SYNC_BUILD_NUMBER_TO_GIT_CUSTOM_VALUE = :SYNC_BUILD_NUMBER_TO_GIT_CUSTOM_VALUE
    end

    # To share this integration with the other fastlane users:
    # - Fork https://github.com/fastlane/fastlane/tree/master/fastlane
    # - Clone the forked repository
    # - Move this integration into lib/fastlane/actions
    # - Commit, push and submit the pull request

    class SyncBuildNumberToGitAction < Action
      def self.is_git?
          Action.sh 'git rev-parse HEAD'
          return true
      rescue
          return false
      end
      def self.run(params)
          if is_git?
              command = 'git rev-list HEAD --count'
          else
              raise 'Not in a git repo.'
          end
          build_number = (Action.sh command).strip
          Fastlane::Actions::IncrementBuildNumberAction.run(build_number: build_number)
          Actions.lane_context[SharedValues::BUILD_NUMBER] = build_number
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Increment build number to git"
      end

      def self.details
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                       env_name: "FL_SYNC_BUILD_NUMBER_TO_GIT_API_TOKEN", # The name of the environment variable
                                       description: "API Token for SyncBuildNumberToGitAction", # a short description of this parameter
                                       verify_block: proc do |value|
                                          UI.user_error!("No API token for SyncBuildNumberToGitAction given, pass using `api_token: 'token'`") unless (value and not value.empty?)
                                          # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :development,
                                       env_name: "FL_SYNC_BUILD_NUMBER_TO_GIT_DEVELOPMENT",
                                       description: "Create a development certificate instead of a distribution one",
                                       is_string: false, # true: verifies the input is a string, false: every kind of value
                                       default_value: false) # the default value if the user didn't provide one
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['BUILD_NUMBER', 'The new build number']
        ]
      end

      def self.return_value
        # If you method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        platform == :ios
      end
    end
  end
end
