#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "RSS Feed M'Vive Fashion News - Мода і Стиль 2017/18"
    xml.description "Актуальні новини в світі високої моди та світського життя в Україні: тренди, жіноча мода, виходи нових колекцій, цікаві факти з життя модельєрів"
    xml.link "https://mvive.net"
    xml.language "ua"

    for news in @news
      xml.item do
        if news.name
          xml.name news.name
        else
          xml.name ""
        end
        xml.pubDate news.created_at.to_s(:rfc822)
        xml.link "https://mvive.net" + news_path(news)
        xml.guid news.id

        text = news.body
        # if you like, do something with your content text here e.g. insert image tags.
        # Optional. I'm doing this on my website.

        xml.description "<p>" + text + "</p>"

      end
    end
  end
end