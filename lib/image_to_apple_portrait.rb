# frozen_string_literal: true

require 'fileutils'
require_relative 'image_to_apple_portrait/multi_exiftool_vendored'

# Init the ExifTool writer
writer = MultiExiftool::Writer.new
writer.overwrite_original = true

# Input directory path
# Put all of the images to be converted to Apple Portrait Mode here.
input_path = File.join('..', 'input', '**.**')

# Output directory path
# The converted image files will be moved to here
output_path = File.join('..', 'output')

# Grab the image files from the ./input dir
input_images = Dir[input_path]

# Warn if there are no images to work with
if input_images.empty?
  puts 'No image(s) found'
  puts
  puts 'Convert any image into Apple Portrait mode'
  puts 'Usage:'
  puts "\tCopy images to be converted into ./inputs/ and try again."
  puts "\tAfter the conversion, you will then find the images inside ./output"
  abort
end

# Update the tag responsible for Apple iOS Portrait mode
# see https://exiftool.org/TagNames/EXIF.html#:~:text=0xa401-,CustomRendered,-int16u
writer.filenames = input_images
writer.values = {
  SceneCaptureType: 'Portrait',
  CustomRendered: 'Portrait' # can also use 'Portrait HDR'
}
written = writer.write

if written
  # Move the converted images to the ./output/ directory
  FileUtils.mv(input_images, output_path)
  puts "#{input_images.length} #{'file'.pluralize(input_images.length)} updated."
else
  # Something went wrong
  puts writer.errors
end
