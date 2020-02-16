# Last character in a file
END_MARK = "\0"

def cargo_to_s(cargo)
  case cargo
  when " "
    "space"
  when "\n"
    "newline"
  when "\t"
    "tab"
  when END_MARK
    "eof"
  else
    cargo
  end
end

class Character
  attr_reader :cargo

  def initialize(cargo, line_index, col_index, source_index, source_text)
    # cargo = the character
    @cargo = cargo
    @line_index = line_index
    @col_index = col_index
    @source_index = source_index
    @source_text = source_text
  end

  def to_s
    sprintf("%6d%4d%11s", @line_index, @col_index, cargo_to_s(@cargo))
  end
end
