class FieldWithErrorsFormBuilder < ActionView::Helpers::FormBuilder
  ADDITIONAL_ERRORS_TEXT = '@@ERRORS'

  def initialize(*args)
    @fields_in_form = []
    super
  end

  def error_messages
    ADDITIONAL_ERRORS_TEXT
  end

  def replace_content(content)
    additional_errors = StaticHelpers::selected_error_messages_for(:object         => @object,
                                                                   :object_name    => "form",
                                                                   :message        => '',
                                                                   :count_excluded => true,
                                                                   :exclude        => fields_included_in_form)

    content.gsub(/#{ADDITIONAL_ERRORS_TEXT}/, additional_errors)
  end

  def field_row(*args)
    options = args.extract_options
    helper  = args[0]
    attr    = args[1]

    helper && attr or raise "first param must be the form_builder helper method and the second param must be the attribute name"

    @fields_in_form << attr

    error_html = ''

    if (errors = @object.errors.on(attr))
      errors = [errors].flatten.join(' and ')
      error_html << '<span class="fieldWithErrorsMessage">'
      error_html << errors.slice(0,1).capitalize + errors.slice(1..-1)
      error_html << '</span>'
    end

    @template.content_tag(:tr) do
      label_html = label(attr, options.delete(:label))
      field_html = send(*args)

      if helper == :check_box
        field_html += " &nbsp;#{label_html}"
        label_html = "&nbsp;"
      end

      if error_html.present?
        field_html = "<table class='no_padding'><tr><td>#{ field_html }</td><td class='valign_middle align_left padding_left_default'>#{ error_html }</td></tr></table>"
      end

      @template.content_tag(:td, label_html, :class => "label") +
      @template.content_tag(:td, field_html, :class => "field")
    end
  end

  def text_row(attr, options = {})
    @template.content_tag( :tr ) do
      label_html = label(attr, options.delete(:label))
      field_html = @template.content_tag(:span, @object.send(attr), :class => :read_only)

      @template.content_tag(:td, label_html, :class => "label") +
      @template.content_tag(:td, field_html, :class => "field")
    end
  end

  def fieldset_with_table(label, &block)
    @template.concat(@template.content_tag(:fieldset) do
                        @template.content_tag(:legend, label) +
                        @template.content_tag(:table, :class => "themed large_form errors_inline", &block)
                      end)
  end

  def fields_included_in_form
    @fields_in_form
  end
end
