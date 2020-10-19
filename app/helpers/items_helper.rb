module ItemsHelper
  def item_lists(_items)
    html = ''
    html += render(partial: 'item', collection: @items)
    raw(html)
  end
end
