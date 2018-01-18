class QuotesController < Rulers::Controller
  def base_quote
    if env["REQUEST_METHOD"] == 'GET'
      "Successful. My first controller in best quotes!!!!!" +
      "<b>Request verb: GET</b>"
    elsif env["REQUEST_METHOD"] == 'POST'
      "Successful. My first controller in best quotes!!!!!" +
      "<b>Request verb: POST</b>"
    else
      "This Http verb is not support!"
    end
  end

  def exception
    raise "Help me!"
  end

  def exception_rescued
    raise "Help me!"
  rescue
    "I am rescued!"
  end

  def exception_begin_rescued_failed
    raise "No rescue here."

    begin
      "I want to show you something."
    rescue
      "I am rescued! (Begin version)"
    end
  end

  def exception_begin_rescued_successful
    begin
      raise "Rescue successfully!"
    rescue
      "I am rescued! (Begin version)"
    end
  end
end
