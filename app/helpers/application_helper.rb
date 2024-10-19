module ApplicationHelper
  def classes_for_flash(flash_key)
    case flash_key.to_s
    when "error"
      "bg-red-600 text-white"
    else
      "bg-black text-white"
    end
  end
end
