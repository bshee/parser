require_relative "nxx_symbols"

class LexerError < StandardError
end

class Token
  attr_accessor :cargo

  def initialize(start_char, type = nil)
    @cargo = start_char.cargo

    @source_text = start_char.source_text
    @line_index = start_char.line_index
    @col_index = start_char.col_index

    @type = type
  end

  # Return a string representation of the Token.
  def show(show_line_numbers: false, align: true)
    if align
      token_type_length = 12
      space = " "
    else
      token_type_length = 0
      space = ""
    end

    start = if show_line_numbers
              sprintf("%6<line_index>d%4<col_index>d ",
                      line_index: @line_index, col_index: @col_index)
            else
              ""
            end

    if @type == @cargo
      sprintf("%<string>s%#<type>s:#{space}#{@type}",
              string: start, type: "Symbol".ljust(token_type_length, "."))
    elsif @type == WHITESPACE
      sprintf("%<string>s%#<type>s:#{space}#{@cargo.inspect}",
              string: start, type: "Symbol".ljust(token_type_length, "."))
    else
      sprintf("%<string>s%#<type>s:#{space}#{@cargo}",
              string: start, type: @type.ljust(token_type_length, "."))
    end
  end

  def abort(message)
    throw LexerError, "In line #{@line_index} near column #{@col_index}: "\
      + message
  end
end
