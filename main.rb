# frozen_string_literal: true

require_relative 'lib/helpers'
require_relative 'lib/image_to_apple_portrait'

converter = ImageToApplePortrait.new
success, num_images, errors = converter.convert

unless success
  # Something went wrong
  puts errors
  abort
end

word_image = Helpers.pluralize('image', num_images)
word_it = Helpers.pluralizeToSpecific('it', 'them', num_images)
puts "#{num_images} #{word_image} updated. Find #{word_it} at ./output"
