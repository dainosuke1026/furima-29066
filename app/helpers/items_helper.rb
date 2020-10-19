module ItemsHelper
  def item_lists(items)
    html = ''
    html += render(partial: "item", collection: @items)
    return raw(html)
  end
end
