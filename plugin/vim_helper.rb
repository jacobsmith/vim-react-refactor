module VimHelper
  def visual_selection
    Vim.evaluate('VisualSelection()')
  end

  def vim_select(options)
    formatted_options = options.map.with_index { |opt, i| "'#{i + 1}. #{opt}'"}.join(', ')
    selection = Vim.evaluate("inputlist(['Select:', #{formatted_options}])")

    puts "options: #{options}"
    puts "selection: #{selection}"
    options[selection - 1]
  end

  def vim_input(prompt)
    Vim.evaluate("input('#{prompt}')")
  end

  def replace(item_to_replace, new_content)
    current = Vim::Buffer.current
    current_line_number = current.line_number
    number_of_lines_to_replace = visual_selection.count("\n") + 1

    delete_lines(starting: current_line_number, delete: number_of_lines_to_replace)

    current[current_line_number] = new_content
  end

  def delete_lines(starting:, delete:)
    current = Vim::Buffer.current

    delete.times do |i|
      current.delete(starting + i)
    end
  end
end
