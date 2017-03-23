class WelcomeController < ApplicationController

  MAX_RETRIES = 3

  def upload
  end


  def upload_post


    files = params[:files]

 #   puts "the contents of files is #{files}"

 #    if !params[ :files ].nil?
 #  		params[ :files ].each{ |file| puts file.content_type}
	# end


    if !files.blank?
      s3 = Aws::S3::Client.new

      files.each do |item|
        try_count = 0
        begin
          uuid = SecureRandom.uuid
          bucket = Rails.application.config.aws[:bucket]
          folder = Rails.application.config.aws[:folder]
          region = Rails.application.config.aws[:region]
          extension = Rack::Mime::MIME_TYPES.invert[item.content_type]
          filename = "#{folder}#{uuid}#{extension}"
          
          s3.put_object bucket: bucket, key: filename, body: item.read

        rescue Exception => e
          puts e
          retry if try_count >= MAX_RETRIES
        end
      end
    end

    redirect_to welcome_upload_path

  end


	

end
