require_relative "character"

class Scanner
  def initialize(source_text)
    @source_text = source_text

    @last_index = @source_text.length - 1
    @source_index = -1
    @line_index = 0
    @col_index = -1
  end

  # Return the next Character in source text.
  def get
    @source_index += 1

    # Maintain line count.
    prev_char = @source_text[@source_index - 1]
    if @source_index > 0 and prev_char == "\n"
      @line_index += 1
      @col_index = -1
    end

    @col_index += 1
    if @source_index > @last_index
      # Read past the end of source text.
      char = END_MARK
    else
      char = @source_text[@source_index]
    end
    Character.new(char, @line_index, @col_index, @source_index, @source_text)
  end
end
