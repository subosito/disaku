module ApplicationHelper
  def to_currency(amount)
    number_to_currency(amount, unit: 'Rp', precision: 0, format: "%u %n", separator: ',', delimiter: '.')
  end

  def link_to_edit(object, link_path)
    link_to(content_tag(:i, nil, class: 'icon-pencil'), link_path, class: 'btn btn-xs btn-info') if can? :edit, object
  end

  def link_to_delete(object, link_path)
    link_to(content_tag(:i, nil, class: 'icon-trash'), link_path, class: 'btn btn-xs btn-danger', method: :delete, data: { confirm: "Are you sure?" }) if can? :delete, object
  end

  def current_user_decorated
    if user_signed_in?
      @current_user_decorated ||= UserDecorator.decorate(current_user)
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
            classes = ['alert', map_classes[name], 'fadeout']
            div msg, :class => classes.join(' '), 'data-dismiss' => 'alert'
          end
        end
      end
    end
  end

  def format_datepicker(date)
    date.strftime("%d-%m-%Y")
  end

  def date_range_start_formatted
    format_datepicker(date_range_start)
  end

  def date_range_end_formatted
    format_datepicker(date_range_end)
  end
end
