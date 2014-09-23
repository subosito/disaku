module ApplicationHelper
  def current_user
    if user_signed_in?
      @current_user_decorated ||= UserDecorator.decorate(@current_user)
    end
  end

  def build_html(assigns = {}, &block)
    ::Mab::PrettyBuilder.new(assigns, self, &block).to_s.html_safe
  end

  def notifications
    return if flash.blank?

    map_classes = {
      notice: 'alert-success',
      alert: 'alert-warning'
    }

    build_html do
      div class: 'notifications' do
        flash.each do |name, msg|
          if msg.is_a? String
            classes = ['alert', map_classes[name.to_sym], 'fadeout']
            div msg, :class => classes.join(' '), 'data-dismiss' => 'alert'
          end
        end
      end
    end
  end

  def format_datepicker(date)
    date.strftime("%Y-%m-%d")
  end

  def date_range_start_formatted
    format_datepicker(date_range_start)
  end

  def date_range_end_formatted
    format_datepicker(date_range_end)
  end

  def current_language
    current_user.present? ? current_user.settings.language : Setting.language
  end
end
