module Fastlane
  module Actions
    module SharedValues
      GIT_COMMIT_ALL_CUSTOM_VALUE = :GIT_COMMIT_ALL_CUSTOM_VALUE
    end

    # To share this integration with the other fastlane users:
    # - Fork https://github.com/fastlane/fastlane/tree/master/fastlane
    # - Clone the forked repository
    # - Move this integration into lib/fastlane/actions
    # - Commit, push and submit the pull request

    class GitCommitAllAction < Action
      def self.run(params)
          Actions.sh "git commit -am\"#{params[:message]}\""
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Commit all unsaved changes to git"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :message,
                                       env_name: "FL_GIT_COMMIT_ALL", 
                                       description: "Git message for the commit", 
                                                                  is_string: true) ]
      end

      def self.output
          # Define the shared values you are going to provide
          # Example
          [
              ['GIT_COMMIT_ALL_CUSTOM_VALUE', 'A description of what this value contains']
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
