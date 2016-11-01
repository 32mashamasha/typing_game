module ApplicationHelper
  # 選択中のサイドメニューのクラスを返す
  def sidebar_activate(sidebar_link_url)
    current_url = request.headers['PATH_INFO']
    if current_url.match(sidebar_link_url)
      ' class="active"'
    else
      ''
    end
  end

  # サイドメニューの項目を出力する
  def sidebar_list_items(items = [])
    html = ''
    items.each.with_index(1) do |item, i|
      score = item.score
      type = item.letter_count
      miss = item.miss_count
      #html = html + %Q(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
      html = html + %Q(<li class=''><a href="#">#{i}:score:#{score} letters:#{type} miss:#{miss}</a></li>)
    end
    raw(html)
  end

end