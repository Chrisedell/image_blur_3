  
# class Image
#   attr_accessor :data

#   def initialize(data)
#     @data = data
#   end

#   def blur
#     # bad code
#     return Image.new(@data)
#   end
# end

class Image
  attr_accessor :image
  def initialize(pixels)
  @image= pixels
  end

  def blur
    ones=[]
    @image.each_with_index do |row, index|
      row.each_with_index do |column, i|
        if column ==1 
          ones << [index, i]
        end
      end
    end
   
   ones.each do |rownumber, colnumber|
    @image[rownumber - 1][colnumber] = 1 unless rownumber == 0 
    @image[rownumber + 1][colnumber] = 1 unless rownumber >= @image.length-1
    @image[rownumber][colnumber - 1] = 1 unless colnumber == 0
    @image[rownumber][colnumber + 1] = 1 unless colnumber >= @image[rownumber].length-1 
   end
  end

  def manhattanDistance(numberOfOnes)
    numberOfOnes.times do 
      blur
    end
  end

  def output_image
    @image.each do |line|
    print line.join()
    puts
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
])


image.manhattanDistance(3)
image.output_image

