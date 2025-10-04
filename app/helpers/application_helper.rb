module ApplicationHelper
  def close_modal
    turbo_stream.replace("modal-toggle", partial: "shared/modal_toggle", locals: { checked: false }) +
      turbo_stream.replace("modal_content", partial: "shared/modal_content")
  end
end
