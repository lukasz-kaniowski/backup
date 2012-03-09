# encoding: utf-8

module Backup
  module Checksum
    class Shasum < Base


      def checksum_with(outfile)
        log!
        yield "shasum '#{outfile}' >> '#{outfile}.sum'"
      end


    end
  end
end
