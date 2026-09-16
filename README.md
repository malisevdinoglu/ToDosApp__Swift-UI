# ToDosApp

ToDosApp, kullanıcıların günlük yapılacak işlerini pratik bir şekilde organize etmelerini sağlayan sade ve modern bir iOS uygulamasıdır. Karmaşık menüler yerine doğrudan görev listeleme, ekleme, güncelleme ve silme akışlarına odaklanarak kişisel görev takibini hızlandırır.

##  Özellikler (Features)

- **Görev Listeleme:** Kaydedilen tüm görevleri başlıkları ve kendilerine özel atanmış kategori ikonlarıyla birlikte ana sayfada listeleme.
- **Boş Durum (Empty State) Bildirimi:** Liste içerisinde herhangi bir görev bulunmadığında kullanıcıyı bilgilendiren dinamik uyarı mesajı.
- **Görev Ekleme ve Form Doğrulama:** Yeni görev oluşturma ekranında boş girdi kontrolü (validation) ve kullanıcıya anlık hata geri bildirimi sunma.
- **Dinamik Görsel İkon Ataması:** Her yeni görev oluşturulduğunda sistemdeki 9 farklı özel vektörel görsel arasından rastgele seçim yapılması.
- **Görev Güncelleme:** Kayıtlı görevin üzerine tıklayarak detaylı düzenleme ekranına geçiş yapma ve mevcut başlığı güncelleme.
- **Hızlı Silme (Swipe-to-Delete):** Görev satırı üzerinde sola kaydırma hareketiyle seçilen elemanı güvenli ve pratik biçimde listeden silme.
- **Dinamik Arama Desteği:** SwiftUI `.searchable` modifiyeri sayesinde liste içerisinde eşzamanlı ve akıcı metin araması gerçekleştirme.
- **Özel Tipografi ve Tema Tasarımı:** Projeye gömülü *Oswald* yazı tipi, global renk paleti (`AppColors`) ve özelleştirilmiş navigasyon çubuğu görünümü.

## Teknolojiler & Mimari (Tech Stack)

- **Frontend / Mobile:** Swift, SwiftUI, NavigationStack (iOS 16+ desteği)
- **Mimari & State Yönetimi:** SwiftUI Bildirime Dayalı (Declarative) UI Mimarisi, `@State`, `@Environment(\.dismiss)`, `Identifiable` Veri Modeli (`ToDos`)
- **Tasarım & UI Bileşenleri:** Custom Font (`oswald.ttf`), `UINavigationBarAppearance`, Asset Catalog Renk Paleti (`AppColors`), Vektörel Görsel Seti
- **Bağımlılıklar:** Yalnızca Apple yerel SDK kütüphaneleri (Harici üçüncü taraf SPM veya CocoaPods bağımlılığı bulunmamaktadır)

##  Kurulum (Getting Started)

```bash
# Repoyu yerel makinenize klonlayın
git clone https://github.com/malisevdinoglu/ToDosApp__Swift-UI.git

# Proje çalışma dizinine geçin
cd ToDosApp__Swift-UI

# Projeyi Xcode geliştirme ortamında açın
open ToDosApp.xcodeproj
```

Xcode arayüzünde üst bardan hedef iOS Simülatörünü (iOS 16+) veya bağlı fiziksel cihazınızı seçtikten sonra `Cmd + R` kısayoluyla projeyi kolayca derleyip çalıştırabilirsiniz.
