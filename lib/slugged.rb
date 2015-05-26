module Slugged
  extend ActiveSupport::Concern

  def to_s
    self.slug.to_s
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= SecureRandom.hex(4)
  end
end