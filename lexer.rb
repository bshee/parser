require_relative "scanner"

class Lexer
  def initialize(source_text)
    @scanner = Scanner.new(source_text)
    next_char
  end

  def skip_whitespace_and_comments
    # Ignore any whitespace or comments
    while WHITESPACE_CHARS.include?(@char1) || @char2 == COMMENT_START_CHARS
      # Process white spaces.
      while WHITESPACE_CHARS.include?(@char1)
        next_char
        # If we wanted to return a token, construct one from the whitespaces.
      end

      while @char2 == COMMENT_START_CHARS
        token = Token.new(@character, COMMENT)
        # Fix cargo for two character token.
        token.cargo = @char2

        # Read past the two character token.
        next_char
        next_char

        until @char2 == COMMENT_END_CHARS
          if @char1 == END_MARK
            token.abort("Found end of file before end of comment")
          end
          token.cargo += @char1
          next_char
        end

        token.cargo += @char2

        # Read past the two character token.
        next_char
        next_char
        # If we wanted to return a token, return here.
      end
    end
  end

  def get
    skip_whitespace_and_comments

    token = Token.new(@character)

    if @char1 == END_MARK
      token.type = EOF
    elsif IDENTIFIER_STARTCHARS.includes?(@char1)
      token.type = IDENTIFIER
      next_char

      while IDENTIFIER_CHARS.includes?(@char1)
        token.cargo += @char1
        next_char
      end

      token.type = token.cargo if KEYWORDS.includes?(token.cargo)
    else
      token.abort("Found unrecognized character or symbol: #{@char1}")
    end
    token
  end

  def next_char
    @current_char = @scanner.get
    # Stores the current character.
    @char1 = @current_char.cargo
    # Stores the current and next character.
    @char2 = @char1 + @scanner.lookahead(1)
  end
end
