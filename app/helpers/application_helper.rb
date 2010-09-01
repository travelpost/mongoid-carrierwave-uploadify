module ApplicationHelper
  def photo_uploadify
    session_key_name = Rails.application.config.session_options[:key]
    %Q{
      <script type='text/javascript'>
        $('#photo_upload').uploadify({
          script          : '#{story_photos_path(@story)}',
          fileDataName    : 'photo[image]',
          uploader        : '/uploadify/uploadify.swf',
          cancelImg       : '/uploadify/cancel.png',
          fileExt         : '*.png;*.jpg;*.gif',
          sizeLimit       : #{10.megabytes},
          multi           : true,
          auto            : true,
          scriptData      : {
            '_http_accept': 'application/javascript',
            '_method'     : 'post',
            '#{session_key_name}' : encodeURIComponent('#{u(cookies[session_key_name])}'),
            'authenticity_token'  : encodeURIComponent('#{u(form_authenticity_token)}')
          }
        });
      </script>
    }.strip.gsub(/[\n ]+/, ' ').html_safe
  end
end
