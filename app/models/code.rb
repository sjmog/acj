require 'carrierwave/orm/activerecord'

class Code < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :task, optional: true

  mount_uploader :pdf, PdfUploader
end
