class ExtractClassWithState < ExtractClass
  register self, 'Extract Class With State'

  def self.template(klass_name)
    <<~EOF
    import React from 'react';

    class #{klass_name} extends React.Component {
      constructor() {
        super();

        this.state = {
          foo: 'bar',
        };
      }

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
