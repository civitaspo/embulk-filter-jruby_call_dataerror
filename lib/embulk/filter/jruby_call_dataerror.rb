module Embulk
  module Filter

    class JrubyCallDataerror < FilterPlugin
      Plugin.register_filter("jruby_call_dataerror", self)

      def self.transaction(config, in_schema, &control)
        # configuration code:
        task = {
        }

        columns = [
          Column.new(nil, "example", :string),
        ]

        yield(task, columns)
      end

      def init
      end

      def close
      end

      def add(page)
        # filtering code:
        page.each do |record|
          begin
            page_builder.add([record.to_s])
            raise ::StandardError, "eeee"
          rescue => e
            raise ::Embulk::DataError.new("embulk-filter-jruby_call_dataerror: #{e}")
          end
        end

      end

      def finish
        page_builder.finish
      end
    end

  end
end
