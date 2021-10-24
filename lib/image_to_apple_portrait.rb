# frozen_string_literal: true

require 'fileutils'
require_relative 'multi_exiftool_vendored'

# Documentation
class ImageToApplePortrait
  VERSION = '0.1.1'

  attr_accessor :input_path, :ouput_path
  attr_reader :filenames

  def initialize(input_dir_path = nil, output_dir_path = nil)
    # Input directory path
    # Put all of the images to be converted to Apple Portrait Mode here
    @input_path = input_dir_path || File.join('input', '**.**')

    # Grab the image files from the dir at input_path
    @filenames = Dir[@input_path]

    # Output directory path
    # Converted image files will be moved into here
    @output_path = output_dir_path || 'output'

    # Init the ExifTool writer
    @writer = MultiExiftool::Writer.new
    @writer.overwrite_original = true
    @writer.filenames = @filenames
  end

  def convert
    # Update the tag responsible for Apple iOS Portrait mode
    # see https://exiftool.org/TagNames/EXIF.html#:~:text=0xa401-,CustomRendered,-int16u
    @writer.values = {
      SceneCaptureType: 'Portrait',
      CustomRendered: 'Portrait' # or could also use 'Portrait HDR'
    }

    success = false
    begin
      success = @writer.write
    rescue StandardError
      puts 'No image(s) to work with'
      puts
      puts 'Convert any image into Apple Portrait mode'
      puts 'Usage:'
      puts "\tCopy images to be converted into ./input/ and try again."
      puts "\tAfter the conversion, you will then find the images inside ./output/"
    end
    # Move the converted images to the ./output/ directory
    FileUtils.mv(@filenames, @output_path) if success

    [success, num_images, @writer.errors]
  end

  def num_images
    @filenames.length
  end
end
