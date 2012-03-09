# encoding: utf-8

module Backup
  module Checksum
    class Base
      include Backup::CLI::Helpers
      include Backup::Configuration::Helpers

      def initialize
        load_defaults!
      end

      def process_checksum_file_before_transfer(file_names_hash, checksum_name, local_path)
        file_names_hash.each do |local, remote|
          replace_in_file(File.join(local_path, checksum_name), /#{File.join(local_path, local)}/) do |match|
            remote
          end
        end
      end

      private

      ##
      # Return the checksum name, with Backup namespace removed
      def checksum_name
        self.class.to_s.sub('Backup::', '')
      end

      ##
      # Logs a message to the console and log file to inform
      # the client that Backup is using the compressor
      def log!
        Logger.message "Using #{ checksum_name } for checksum."
      end


      def replace_in_file(filepath, regexp, *args, &block)
        content = File.read(filepath).gsub(regexp, *args, &block)
        File.open(filepath, 'wb') { |file| file.write(content) }
      end

    end
  end
end
