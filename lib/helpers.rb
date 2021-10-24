# frozen_string_literal: true

# Helper methods
class Helpers
  def self.pluralize(singular_form, num)
    # Add an 's' at the end
    num == 1 ? singular_form : "#{singular_form}s"
  end

  def self.pluralizeToSpecific(singular_form, plural_form, num)
    # Use the given plural form
    num == 1 ? singular_form : plural_form
  end
end
