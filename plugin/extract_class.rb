require_relative './react_refactor'

class ExtractClass < ReactRefactor
  register self, 'Extract Class'

  def self.execute
    File.open(klass_name + '.js', 'w') do |file|
      file.puts template(klass_name)
    end

    replace(visual_selection, "<#{klass_name} />")
  end

  def self.klass_name
    klass_name = (visual_selection.match(/[A-Z]\w+/) || [])[0]
    if !klass_name
      klass_name = vim_input("Name of file to create relative to current directory: ")
    end

    if !klass_name
      puts "Must provide a file name to perform extract class refactor"
      exit
    end

    klass_name
  end

  def self.template(klass_name)
    <<~EOF
    import React from 'react';

    class #{klass_name} extends React.Component {
      render() {
        return (
          #{visual_selection}
        );
      }
    }

    export default #{klass_name};
    EOF
  end
end
