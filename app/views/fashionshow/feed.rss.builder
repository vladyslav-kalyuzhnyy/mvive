#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "RSS Feed M'Vive Fashion News - Мода і Стиль 2017/18"
    xml.description "Актуальні новини в світі високої моди та світського життя в Україні: тренди, жіноча мода, виходи нових колекцій, цікаві факти з життя модельєрів"
    xml.link "http://mvive.net"
    xml.language "ua"

    for fashionshow in @fashionshow
      xml.item do
        if fashionshow.name
          xml.name fashionshow.name
        else
          xml.name ""
        end
        xml.pubDate fashionshow.created_at.to_s(:rfc822)
        xml.link "http://mvive.net/fashionshow" + fashionshow_path(fashionshow)
        xml.guid fashionshow.id

        text = fashionshow.body

        xml.description "<p>" + text + "</p>"

      end
    end
  end
end