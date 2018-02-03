class QuotesController < Rulers::Controller
  def base_quote
    @foo = 'barbarbar'
    render :base_quote, foo: "bar"
  end
end
