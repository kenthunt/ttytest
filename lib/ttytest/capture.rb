module TTYtest
  class Capture
    include TTYtest::Matchers

    attr_reader :cursor_x, :cursor_y, :cursor_visible

    def initialize(contents, cursor_x: 0, cursor_y: 0, cursor_visible: true)
      @rows = (contents+"\nEND").split("\n")[0...-1].map do |row|
        row || ""
      end
      @cursor_x = cursor_x
      @cursor_y = cursor_y
      @cursor_visible = cursor_visible
    end

    def cursor_position
      [@cursor_x, @cursor_y]
    end

    def rows
      @rows
    end

    def row(row)
      rows[row]
    end

    def capture
      self
    end

    def to_s
      rows.join("\n")
    end
  end
end