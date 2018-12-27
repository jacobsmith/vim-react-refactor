require 'vim_helper'

class ReactRefactor
  extend ::VimHelper

  @@_handlers = {}

  def self.execute
    Dir.glob('*.rb').each { |file| require file }
    values = @@_handlers.values
    selected_value = vim_select(values)
    puts "selected_value: #{selected_value}"

    @@_handlers
      .keys
      .find do |key|
        puts "key: #{key}"
        @@_handlers[key] == selected_value
      end.execute
  end

  def self.register(klass, option)
    @@_handlers[klass] = option
  end
end
