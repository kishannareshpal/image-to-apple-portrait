# frozen_string_literal: true

require 'multi_exiftool'

# Load the included ExifTool Perl library.
vendor_path = File.join(__dir__, 'vendor', 'Image-ExifTool-12.33', 'exiftool')
MultiExiftool.exiftool_command = vendor_path
