Dir.glob("*.rb").each {|file| require file }

class ReactRefactor
  extend ::VimHelper

  @@_handlers = {}

  def self.execute
    values = @@_handlers.values
    selected_value = vim_select(values)

    @@_handlers.keys.first { |key| @@_handler[key] == selected_value }.execute
  end

  def self.register(klass, option)
    @@_handlers[klass] = option
  end
end
