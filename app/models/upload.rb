class Upload < ActiveRecord::Base
  attr_accessible :upload
  attr_accessible :category

  has_attached_file :upload,
                    :styles => { :normal => "215x215#", :thumb=> "50x50#" }

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "category" => read_attribute(:category),
      "thumbnail_url" => upload.url(:thumb),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
