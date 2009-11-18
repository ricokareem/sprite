module Sprite
  module Styles
    # renders standard css style rules
    class CssGenerator
      def initialize(builder)
        @builder = builder
      end
  
      def generate(sprite_files)
        output = ""
    
        # set up class_name to append to each rule
        sprites_class = @builder.config['sprites_class'] ? ".#{@builder.config['sprites_class']}" : ""
    
        # write stylesheet file to disk
        sprite_files.each do |sprite_file, sprites|
          sprites.each do |sprite|
            output << "#{sprites_class}.#{sprite[:group]}#{@builder.config['class_separator']}#{sprite[:name]} {\n"
            output << "  background: url('/#{@builder.config['image_output_path']}#{sprite_file}') no-repeat #{sprite[:x]}px #{sprite[:y]}px;\n"
            output << "  width: #{sprite[:width]}px;\n"
            output << "  height: #{sprite[:height]}px;\n"
            output << "}\n"
          end
        end
    
        output
      end
  
      def extension
        "css"
      end
    end
  end
end