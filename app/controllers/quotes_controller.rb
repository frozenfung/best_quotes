class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end

  def base_quote
    @foo = 'barbarbar'
    render :base_quote, foo: "bar"
  end
end
