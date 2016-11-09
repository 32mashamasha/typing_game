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
    if items.blank?
      html = '<h3>データがありません</h3>'
      return raw(html)
    end
    items.each.with_index(1) do |item, i|
      score = item.score
      type = item.letter_count
      miss = item.miss_count
      category_name = Category.find(item.category_id).name rescue nil
      html = html + %Q(<li class=''><a href="#">#{i}:score:#{score} letters:#{type} miss:#{miss}　　#{category_name}</a></li>)
    end
    raw(html)
  end

  def condition_name(condition)    
    case condition
    when 'score'
      '正解数順'
    when 'letter_count'
      'タイプ数多い順'
    when 'miss_count'
      'ミスタッチ少ない順'
    end
  end

end