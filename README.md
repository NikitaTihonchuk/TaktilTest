# TaktilTest

В данном проекте я использовал такие библиотеки как:
pod 'Moya'
pod 'SDWebImage'
pod 'JGProgressHUD'

Для разработки первой страницы я использовал tableView и кастомную ячейку, для второй страницы, в которой находится информация о книге, я использовал также tableView, с тремя кастомными ячейками. Для связи ячеек и tableView я использовал enum. Под каждый запрос на сервере я также сделал enum. Для того, чтобы получить данные с сервера, я создавал модельку и подписывал ее под протокол Decodable, чтобы поместить туда нужные значения. Так как информация о книге, находилась по двум разным запросам, то для объединения я создал кортеж. В процессе разработки дополнительно распарсил автора, для отображения его на странице с дополнительной информацией о книге. В процессе разработки возникла проблема с тем, чтобы достать рейтинг из запроса(обработал эту ошибку при помощи do catch). Скрины прилагаю ниже 

<img width="439" alt="Снимок экрана 2023-04-14 в 12 44 46" src="https://user-images.githubusercontent.com/55090468/232009934-4a471b61-6e5f-4f11-ba65-af742208aa6a.png">
<img width="497" alt="Снимок экрана 2023-04-14 в 12 44 58" src="https://user-images.githubusercontent.com/55090468/232009945-4e19b565-48c0-4b3b-b9f6-abb46956ad9d.png">
