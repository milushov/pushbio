# encoding: utf-8

class BaseImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.pluralize.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    asset_path('fallback/' + [version_name, 'default.png'].compact.join('_'))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
