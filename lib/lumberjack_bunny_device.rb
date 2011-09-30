require "lumberjack_bunny_device/version"
require 'lumberjack'
require 'bunny'

module Lumberjack
  class Device
    class Bunny < Device

      attr_accessor :options

      def initialize(options={})
        options = options.dup
        @exchange_name = options.delete(:exchange)
        @routing_key = options.delete(:routing_key)
        @options = options

        @lock = ::Mutex.new
      end

      def write(entry)
        @lock.synchronize do
          exchange.publish(entry.message, :key => @routing_key)
        end
      end

      def close
        flush
        @lock.synchronize do
          bunny.stop if bunny 
        end
      end

      def flush
        
      end

      def bunny
        unless @bunny
          @bunny = ::Bunny.new(options)
          @bunny.start
        end
        @bunny
      end

      def exchange
        @exchange ||= bunny.exchange(@exchange_name)
      end
    end
  end
end
