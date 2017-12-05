class PdfUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/tasks/#{model.task.id}/"
  end

  def extension_whitelist
    %w(pdf)
  end

  def filename
    if file.present?
      "#{file.filename}.#{file.extension}"
    end
  end
end
