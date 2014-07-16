# dell_check.rb
# ===
#
# Checks hardware status of Dell components using 
# openmanage.
#
# Copyright (c) 2014 GoDaddy Operating Company, LLC
#
# Released under the same terms as Sensu (the MIT license); see LICENSE.txt
# for details.

module Sensu
  module Extension
    class DellCheck < Check
      def name
        'dell_check'
      end

      def description
        'collects status of dell server hardware'
      end

      def definition
        {
	  :type => 'check',
          :name => name,
          :interval => options[:interval],
          :handler => options[:handler]
          :standalone => true,
        }
      end

      def run
      end

      private

      def options
        return @options if @options
        @options = {
        }
        if settings[:dell_check].is_a?(Hash)
          @options.merge!(settings[:dell_check])
        end
        @options
      end

    end
  end
end
