=begin
- define a method named listen
- it takes a block if a block is given 
- if a block is given
 - yield to the block and pass the return value of the block to the recording method

- define a method named play
- it returns the last added recording
=end


class Device
  def initialize
    @recordings = []
  end

  def listen
    if block_given?
      record(yield)
    end
  end

  def play
    puts @recordings.last
  end

  def record(recording)
    @recordings << recording
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"