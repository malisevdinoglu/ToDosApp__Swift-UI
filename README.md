# ToDosApp - iOS Task Management Application

<div align="center">

![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2015+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-red.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

### Language / Dil
**[English](#english)** | **[Türkçe](#turkish)**

---

## English

A clean and intuitive iOS task management application built with SwiftUI, featuring local data persistence, task categorization, and a beautiful modern interface.

[Features](#features) • [Architecture](#architecture) • [Installation](#installation) • [Screenshots](#screenshots) • [Tech Stack](#tech-stack)

</div>

---

## 📋 Overview

ToDosApp is a lightweight, user-friendly task management application designed to help users organize their daily tasks efficiently. Built entirely with SwiftUI, the app demonstrates modern iOS development practices including MVVM architecture, local data persistence, and responsive design principles.

The application focuses on simplicity and usability, providing essential task management features without overwhelming complexity. Users can quickly add tasks, mark them as complete, organize them by categories, and maintain a clean overview of their to-do lists.

## 🎯 Project Goals

The primary objectives of this project are:

1. **SwiftUI Proficiency**: Demonstrate mastery of SwiftUI framework and modern iOS development
2. **Clean Architecture**: Implement MVVM pattern for maintainable and testable code
3. **Data Persistence**: Utilize UserDefaults/Core Data for reliable local storage
4. **User Experience**: Create an intuitive, responsive interface that users love
5. **Best Practices**: Follow Apple's Human Interface Guidelines and Swift conventions
6. **Performance**: Ensure smooth animations and instant response times

## ✨ Features

### 📝 Task Management
- **Create Tasks**: Quickly add new tasks with title and optional description
- **Edit Tasks**: Modify task details anytime
- **Delete Tasks**: Remove completed or unwanted tasks
- **Mark Complete**: Check off tasks as you complete them
- **Task Details**: View and edit comprehensive task information
- **Reorder Tasks**: Drag and drop to prioritize (if implemented)

### 🗂️ Organization
- **Categories**: Organize tasks by categories (Work, Personal, Shopping, etc.)
- **Priority Levels**: Set task priority (High, Medium, Low)
- **Due Dates**: Assign deadlines to tasks
- **Search**: Find tasks quickly with search functionality
- **Filter**: View tasks by status (all, active, completed)
- **Sort**: Sort by date, priority, or alphabetically

### 🎨 User Interface
- **Modern Design**: Clean, minimal interface following iOS design principles
- **Smooth Animations**: Polished transitions and interactions
- **Dark Mode Support**: Full support for light and dark themes
- **Custom Components**: 
  - Task cards with swipe actions
  - Custom checkboxes
  - Beautiful date pickers
  - Category badges
- **Empty States**: Helpful messages when no tasks exist
- **Responsive Layout**: Works perfectly on all iPhone sizes

### 💾 Data Management
- **Local Storage**: Tasks persist across app launches
- **Auto-Save**: Changes saved automatically
- **Data Integrity**: Reliable storage with error handling
- **Migration Support**: Handles app updates smoothly
- **Backup Ready**: Data structured for easy backup/restore

### 🔔 Additional Features
- **Task Statistics**: View productivity metrics
- **Completion Tracking**: Track task completion rates
- **Today's Tasks**: Quick view of today's tasks
- **Overdue Alerts**: Visual indicators for overdue tasks
- **Quick Actions**: Long-press shortcuts for common actions

---

## 🏗️ Architecture

ToDosApp follows the MVVM (Model-View-ViewModel) architecture pattern:

```
┌─────────────────────────────────────────────────────┐
│                  Views (SwiftUI)                     │
│   TaskListView, TaskDetailView, AddTaskView         │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                   ViewModels                         │
│       TaskListViewModel, TaskDetailViewModel        │
│              (@ObservableObject)                     │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                    Models                            │
│           Task, Category, Priority, Status           │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                  Persistence                         │
│      UserDefaults / CoreData / SwiftData             │
└──────────────────────────────────────────────────────┘
```

### Key Components

#### 1. **Models**
```swift
struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String?
    var isCompleted: Bool
    var category: Category
    var priority: Priority
    var dueDate: Date?
    var createdAt: Date
    var completedAt: Date?
}

enum Category: String, CaseIterable, Codable {
    case work = "Work"
    case personal = "Personal"
    case shopping = "Shopping"
    case health = "Health"
    case other = "Other"
}

enum Priority: Int, CaseIterable, Codable {
    case low = 0
    case medium = 1
    case high = 2
}
```

#### 2. **ViewModels**
```swift
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var searchText: String = ""
    @Published var filterOption: FilterOption = .all
    @Published var sortOption: SortOption = .dateCreated
    
    func addTask(_ task: Task)
    func updateTask(_ task: Task)
    func deleteTask(_ task: Task)
    func toggleCompletion(for task: Task)
    func filteredAndSortedTasks() -> [Task]
}
```

#### 3. **Views**
- **TaskListView**: Main view displaying all tasks
- **TaskRowView**: Individual task item in the list
- **AddTaskView**: Form for creating new tasks
- **TaskDetailView**: Detailed view and editing interface
- **SettingsView**: App settings and preferences
- **StatisticsView**: Task statistics and insights

#### 4. **Persistence Layer**
```swift
class TaskStore {
    private let userDefaultsKey = "savedTasks"
    
    func loadTasks() -> [Task]
    func saveTasks(_ tasks: [Task])
    func clearAllTasks()
}
```

---

## 🚀 Installation

### Prerequisites

- **Xcode 14+**
- **iOS 15.0+**
- **Swift 5.9+**
- **macOS 12.0+** (for development)

### Setup Steps

1. **Clone the Repository**
```bash
git clone https://github.com/malisevdinoglu/ToDosApp__Swift-UI.git
cd ToDosApp__Swift-UI
```

2. **Open in Xcode**
```bash
open ToDosApp.xcodeproj
```

3. **Configure Signing**
   - Select your development team in `Signing & Capabilities`
   - Update Bundle Identifier if needed
   - Ensure proper provisioning profile

4. **Build and Run**
   - Select iOS 15+ Simulator or physical device
   - Press `Cmd + R` to build and run
   - Start managing your tasks!

### No External Dependencies
This project uses only native iOS frameworks - no third-party libraries required!

---

## 📱 Usage

### Adding a Task

1. **Tap the "+" Button**
   - Located at the top right of the task list
   - Opens the Add Task form

2. **Fill in Task Details**
   ```
   Title: Buy groceries (Required)
   Description: Milk, bread, eggs (Optional)
   Category: Shopping
   Priority: Medium
   Due Date: Tomorrow
   ```

3. **Save**
   - Tap "Save" button
   - Task appears in your list instantly

### Managing Tasks

#### **Mark as Complete**
- Tap the checkbox next to a task
- Completed tasks show with strikethrough text
- Moves to completed section (if filtering enabled)

#### **Edit a Task**
- Tap on any task to open details
- Modify any field
- Changes save automatically

#### **Delete a Task**
- Swipe left on a task
- Tap the red delete button
- Or use Edit mode for batch deletion

### Organizing Tasks

#### **Filter Tasks**
```
All Tasks: Show everything
Active: Only incomplete tasks
Completed: Only finished tasks
```

#### **Search Tasks**
- Use the search bar at the top
- Searches in title and description
- Results update in real-time

#### **Sort Tasks**
```
By Date: Newest or oldest first
By Priority: High to low
By Title: Alphabetical order
By Due Date: Upcoming deadlines first
```

### Categories & Priorities

#### **Categories**
- Work: Professional tasks
- Personal: Private matters
- Shopping: Purchase lists
- Health: Fitness & medical
- Other: Miscellaneous

#### **Priority Levels**
🔴 **High**: Urgent, important tasks
🟡 **Medium**: Normal priority
🟢 **Low**: Can wait, nice to have

---

## 🛠️ Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| **UI Framework** | SwiftUI | Modern declarative UI |
| **Architecture** | MVVM | Clean code organization |
| **Programming Language** | Swift 5.9+ | Type-safe development |
| **Data Persistence** | UserDefaults / Core Data | Local storage |
| **State Management** | @State, @Binding, @ObservableObject | Reactive updates |
| **Concurrency** | Async/Await (if needed) | Background operations |
| **Design Patterns** | Repository, Singleton | Code structure |
| **Testing** | XCTest | Unit tests |

### Swift Features Used
- **SwiftUI**: Declarative UI framework
- **Property Wrappers**: @State, @Binding, @StateObject
- **Combine**: Reactive programming (optional)
- **Codable**: JSON encoding/decoding
- **Identifiable**: List management
- **Enums**: Type-safe categories and priorities
- **Computed Properties**: Dynamic data
- **Extensions**: Code organization

---

## 📂 Project Structure

```
ToDosApp/
├── ToDosApp.swift              # App entry point
│
├── Models/
│   ├── Task.swift              # Task data model
│   ├── Category.swift          # Category enum
│   ├── Priority.swift          # Priority levels
│   └── FilterOption.swift      # Filter types
│
├── ViewModels/
│   ├── TaskListViewModel.swift # Main list logic
│   ├── AddTaskViewModel.swift  # Add task logic
│   └── StatisticsViewModel.swift # Statistics
│
├── Views/
│   ├── TaskListView.swift      # Main task list
│   ├── TaskRowView.swift       # Task list item
│   ├── AddTaskView.swift       # Add/Edit form
│   ├── TaskDetailView.swift    # Task details
│   ├── SettingsView.swift      # App settings
│   ├── StatisticsView.swift    # Stats dashboard
│   └── EmptyStateView.swift    # Empty state
│
├── Components/
│   ├── CustomCheckbox.swift    # Checkbox component
│   ├── PriorityBadge.swift     # Priority indicator
│   ├── CategoryBadge.swift     # Category tag
│   ├── DatePickerField.swift   # Date selector
│   └── SearchBarView.swift     # Search bar
│
├── Services/
│   ├── TaskStore.swift         # Persistence layer
│   └── NotificationManager.swift # Local notifications
│
├── Utilities/
│   ├── Extensions/
│   │   ├── Date+Extension.swift    # Date helpers
│   │   ├── Color+Extension.swift   # Custom colors
│   │   └── View+Extension.swift    # View modifiers
│   ├── Constants.swift         # App constants
│   └── Helpers.swift           # Helper functions
│
└── Resources/
    ├── Assets.xcassets         # Images & colors
    ├── Localizable.strings     # Translations
    └── Info.plist              # App configuration
```

---

## 🎨 Design System

### Color Palette

```swift
extension Color {
    // Primary Colors
    static let primaryBlue = Color("PrimaryBlue")
    static let accentOrange = Color("AccentOrange")
    
    // Task Status
    static let taskActive = Color("TaskActive")
    static let taskCompleted = Color("TaskCompleted")
    static let taskOverdue = Color("TaskOverdue")
    
    // Priority Colors
    static let priorityHigh = Color.red
    static let priorityMedium = Color.orange
    static let priorityLow = Color.green
    
    // Background
    static let backgroundPrimary = Color("BackgroundPrimary")
    static let backgroundSecondary = Color("BackgroundSecondary")
    static let cardBackground = Color("CardBackground")
    
    // Text
    static let textPrimary = Color("TextPrimary")
    static let textSecondary = Color("TextSecondary")
}
```

### Typography

```swift
extension Font {
    // Headers
    static let taskTitle = Font.system(size: 18, weight: .semibold)
    static let taskDescription = Font.system(size: 14, weight: .regular)
    
    // Body
    static let bodyText = Font.system(size: 16, weight: .regular)
    static let caption = Font.system(size: 12, weight: .regular)
    
    // Special
    static let categoryBadge = Font.system(size: 11, weight: .medium)
    static let priorityBadge = Font.system(size: 10, weight: .bold)
}
```

### Layout Constants

```swift
enum Layout {
    static let padding: CGFloat = 16
    static let cornerRadius: CGFloat = 12
    static let spacing: CGFloat = 8
    static let shadowRadius: CGFloat = 3
}
```

---

## 🔧 Configuration

### Task Model Configuration

```swift
struct Task: Identifiable, Codable {
    let id: UUID = UUID()
    var title: String
    var description: String? = nil
    var isCompleted: Bool = false
    var category: Category = .other
    var priority: Priority = .medium
    var dueDate: Date? = nil
    var createdAt: Date = Date()
    var completedAt: Date? = nil
    
    var isOverdue: Bool {
        guard let dueDate = dueDate, !isCompleted else { return false }
        return dueDate < Date()
    }
    
    var formattedDueDate: String? {
        guard let dueDate = dueDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: dueDate)
    }
}
```

### UserDefaults Keys

```swift
enum UserDefaultsKeys {
    static let tasks = "savedTasks"
    static let selectedCategory = "selectedCategory"
    static let sortPreference = "sortPreference"
    static let filterPreference = "filterPreference"
}
```

---

## 🎯 Features Implementation

### Task Creation Flow

```swift
// AddTaskView
@StateObject private var viewModel = AddTaskViewModel()

var body: some View {
    Form {
        Section("Task Details") {
            TextField("Title", text: $viewModel.title)
            TextField("Description", text: $viewModel.description)
        }
        
        Section("Organization") {
            Picker("Category", selection: $viewModel.category) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            
            Picker("Priority", selection: $viewModel.priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.label).tag(priority)
                }
            }
        }
        
        Section("Due Date") {
            Toggle("Set Due Date", isOn: $viewModel.hasDueDate)
            if viewModel.hasDueDate {
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
            }
        }
        
        Button("Save Task") {
            viewModel.saveTask()
        }
        .disabled(!viewModel.isValid)
    }
}
```

### Task Filtering

```swift
func filteredTasks() -> [Task] {
    var filtered = tasks
    
    // Filter by search text
    if !searchText.isEmpty {
        filtered = filtered.filter { task in
            task.title.localizedCaseInsensitiveContains(searchText) ||
            (task.description?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
    }
    
    // Filter by status
    switch filterOption {
    case .all:
        break
    case .active:
        filtered = filtered.filter { !$0.isCompleted }
    case .completed:
        filtered = filtered.filter { $0.isCompleted }
    }
    
    // Sort
    switch sortOption {
    case .dateCreated:
        filtered.sort { $0.createdAt > $1.createdAt }
    case .priority:
        filtered.sort { $0.priority.rawValue > $1.priority.rawValue }
    case .dueDate:
        filtered.sort { ($0.dueDate ?? .distantFuture) < ($1.dueDate ?? .distantFuture) }
    }
    
    return filtered
}
```

---

## 🐛 Troubleshooting

### Common Issues

**Problem**: Tasks not persisting after app restart
**Solution**: 
```swift
// Ensure tasks are saved to UserDefaults
func saveTasks() {
    if let encoded = try? JSONEncoder().encode(tasks) {
        UserDefaults.standard.set(encoded, forKey: "savedTasks")
    }
}
```

**Problem**: App crashes when deleting tasks
**Solution**:
- Check for proper array index management
- Use `.onDelete` modifier correctly in List
- Ensure state updates are on main thread

**Problem**: Date picker not showing
**Solution**:
- Verify iOS version compatibility (15+)
- Check DatePicker configuration
- Ensure proper state binding

**Problem**: Search not working
**Solution**:
- Verify searchText binding
- Check filter logic for case-sensitivity
- Ensure view updates when search changes

**Problem**: Dark mode colors incorrect
**Solution**:
- Define color assets in Assets.xcassets
- Set both light and dark variants
- Use Color("ColorName") instead of hardcoded colors

---

## 🗺️ Roadmap

### Planned Features

- [ ] **Cloud Sync** with iCloud
- [ ] **Subtasks** and task dependencies
- [ ] **Recurring Tasks** (daily, weekly, monthly)
- [ ] **Reminders** with local notifications
- [ ] **Tags** system for better organization
- [ ] **Collaboration** - share tasks with others
- [ ] **Widgets** for home screen
- [ ] **Apple Watch** companion app
- [ ] **Siri Shortcuts** integration
- [ ] **Export/Import** tasks (JSON, CSV)
- [ ] **Themes** customization
- [ ] **Task Templates** for recurring patterns
- [ ] **Productivity Analytics** with charts
- [ ] **Time Tracking** for tasks
- [ ] **Attachments** (photos, files)
- [ ] **Voice Input** for quick task entry

### UI/UX Improvements

- [ ] Enhanced animations and transitions
- [ ] Haptic feedback for interactions
- [ ] Swipe gestures for quick actions
- [ ] Drag and drop reordering
- [ ] Customizable task views (list, grid, board)
- [ ] Color coding for categories
- [ ] Progress indicators
- [ ] Confetti animation on completion
- [ ] Undo/redo functionality
- [ ] Keyboard shortcuts (iPad)

### Technical Improvements

- [ ] Unit tests coverage
- [ ] UI tests automation
- [ ] Core Data migration
- [ ] SwiftData adoption (iOS 17+)
- [ ] Performance optimization
- [ ] Accessibility improvements
- [ ] Localization (multiple languages)
- [ ] Error handling refinement
- [ ] Code documentation
- [ ] CI/CD pipeline

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Erdem Maliş

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

## 🤝 Contributing

Contributions are welcome! This is a learning project, and improvements are encouraged.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Ideas

- Add new features from the roadmap
- Improve UI/UX design
- Write unit tests
- Fix bugs
- Improve documentation
- Add localization
- Optimize performance

---

## 🙏 Acknowledgments

- **Apple**: SwiftUI framework and excellent documentation
- **iOS Development Community**: Tutorials and best practices
- **Design Inspiration**: Modern task management apps
- **Open Source Community**: Code examples and patterns

---

## 📧 Contact

**Developer**: Erdem Maliş

- GitHub: [@malisevdinoglu](https://github.com/malisevdinoglu)
- LinkedIn: [Mehmet Ali Sevdinoglu](https://linkedin.com/in/erdem-malis)
- Email: [Contact via GitHub](https://github.com/malisevdinoglu)

---

<div align="center">

**⭐ If you find this project useful, please consider giving it a star!**

Made with 💻 and ☕ by [Mehmet Ali Sevdinoglu](https://github.com/malisevdinoglu)

**SwiftUI • Task Management • iOS**

</div>

---
---
---

<div id="turkish"></div>

# ToDosApp - iOS Görev Yönetim Uygulaması

<div align="center">

![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2015+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-red.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![License](https://img.shields.io/badge/Lisans-MIT-green.svg)

**[English](#english)** | **[Türkçe](#turkish)**

SwiftUI ile geliştirilmiş, yerel veri kalıcılığı, görev kategorilendirmesi ve güzel modern arayüze sahip temiz ve sezgisel bir iOS görev yönetim uygulaması.

[Özellikler](#özellikler-tr) • [Mimari](#mimari-tr) • [Kurulum](#kurulum-tr) • [Ekran Görüntüleri](#ekran-görüntüleri-tr) • [Teknoloji Yığını](#teknoloji-yığını-tr)

</div>

---

## 📋 Genel Bakış

ToDosApp, kullanıcıların günlük görevlerini verimli bir şekilde organize etmelerine yardımcı olmak için tasarlanmış hafif, kullanıcı dostu bir görev yönetim uygulamasıdır. Tamamen SwiftUI ile oluşturulan uygulama, MVVM mimarisi, yerel veri kalıcılığı ve duyarlı tasarım ilkeleri dahil olmak üzere modern iOS geliştirme uygulamalarını göstermektedir.

Uygulama, karmaşıklığı aşırı olmadan temel görev yönetimi özelliklerini sağlayarak basitlik ve kullanılabilirliğe odaklanır. Kullanıcılar hızlıca görev ekleyebilir, tamamlandı olarak işaretleyebilir, kategorilere göre düzenleyebilir ve yapılacaklar listelerinin temiz bir özetini tutabilir.

## 🎯 Proje Hedefleri

Bu projenin temel amaçları:

1. **SwiftUI Yeterliliği**: SwiftUI framework'ü ve modern iOS geliştirmedeki ustalığı göstermek
2. **Temiz Mimari**: Sürdürülebilir ve test edilebilir kod için MVVM desenini uygulamak
3. **Veri Kalıcılığı**: Güvenilir yerel depolama için UserDefaults/Core Data kullanmak
4. **Kullanıcı Deneyimi**: Kullanıcıların sevdiği sezgisel, duyarlı bir arayüz oluşturmak
5. **En İyi Uygulamalar**: Apple'ın İnsan Arayüzü Kılavuzları ve Swift kurallarını takip etmek
6. **Performans**: Akıcı animasyonlar ve anında yanıt süreleri sağlamak

## ✨ Özellikler {#özellikler-tr}

### 📝 Görev Yönetimi
- **Görev Oluştur**: Başlık ve isteğe bağlı açıklama ile hızlıca yeni görevler ekle
- **Görev Düzenle**: Görev detaylarını istediğiniz zaman değiştir
- **Görev Sil**: Tamamlanan veya istenmeyen görevleri kaldır
- **Tamamlandı İşaretle**: Görevleri tamamladıkça işaretle
- **Görev Detayları**: Kapsamlı görev bilgilerini görüntüle ve düzenle
- **Görevleri Yeniden Sırala**: Önceliklendirmek için sürükle bırak

### 🗂️ Organizasyon
- **Kategoriler**: Görevleri kategorilere göre düzenle (İş, Kişisel, Alışveriş vb.)
- **Öncelik Seviyeleri**: Görev önceliği ayarla (Yüksek, Orta, Düşük)
- **Son Tarihler**: Görevlere son tarih ata
- **Arama**: Arama işlevselliği ile görevleri hızlı bul
- **Filtrele**: Duruma göre görevleri görüntüle (tümü, aktif, tamamlandı)
- **Sırala**: Tarihe, önceliğe veya alfabetik sıraya göre sırala

### 🎨 Kullanıcı Arayüzü
- **Modern Tasarım**: iOS tasarım ilkelerini takip eden temiz, minimal arayüz
- **Yumuşak Animasyonlar**: Cilalı geçişler ve etkileşimler
- **Koyu Mod Desteği**: Açık ve koyu temalar için tam destek
- **Özel Bileşenler**: 
  - Kaydırma eylemleri ile görev kartları
  - Özel onay kutuları
  - Güzel tarih seçiciler
  - Kategori rozetleri
- **Boş Durumlar**: Görev olmadığında yardımcı mesajlar
- **Duyarlı Düzen**: Tüm iPhone boyutlarında mükemmel çalışır

### 💾 Veri Yönetimi
- **Yerel Depolama**: Görevler uygulama başlatmaları arasında kalır
- **Otomatik Kaydet**: Değişiklikler otomatik olarak kaydedilir
- **Veri Bütünlüğü**: Hata işleme ile güvenilir depolama
- **Geçiş Desteği**: Uygulama güncellemelerini sorunsuz işler
- **Yedekleme Hazır**: Kolay yedekleme/geri yükleme için yapılandırılmış veri

### 🔔 Ek Özellikler
- **Görev İstatistikleri**: Üretkenlik metriklerini görüntüle
- **Tamamlanma Takibi**: Görev tamamlanma oranlarını izle
- **Bugünün Görevleri**: Bugünün görevlerini hızlı görüntüle
- **Gecikme Uyarıları**: Geciken görevler için görsel göstergeler
- **Hızlı Eylemler**: Yaygın eylemler için uzun basma kısayolları

---

## 🏗️ Mimari {#mimari-tr}

ToDosApp MVVM (Model-View-ViewModel) mimari desenini izler:

```
┌─────────────────────────────────────────────────────┐
│              Views (SwiftUI) - Görünümler            │
│   TaskListView, TaskDetailView, AddTaskView         │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                   ViewModels                         │
│       TaskListViewModel, TaskDetailViewModel        │
│              (@ObservableObject)                     │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                  Models - Modeller                   │
│           Task, Category, Priority, Status           │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│              Persistence - Kalıcılık                 │
│      UserDefaults / CoreData / SwiftData             │
└──────────────────────────────────────────────────────┘
```

### Ana Bileşenler

#### 1. **Modeller**
```swift
struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String?
    var isCompleted: Bool
    var category: Category
    var priority: Priority
    var dueDate: Date?
    var createdAt: Date
    var completedAt: Date?
}

enum Category: String, CaseIterable, Codable {
    case work = "İş"
    case personal = "Kişisel"
    case shopping = "Alışveriş"
    case health = "Sağlık"
    case other = "Diğer"
}

enum Priority: Int, CaseIterable, Codable {
    case low = 0
    case medium = 1
    case high = 2
}
```

#### 2. **ViewModeller**
```swift
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var searchText: String = ""
    @Published var filterOption: FilterOption = .all
    @Published var sortOption: SortOption = .dateCreated
    
    func addTask(_ task: Task)
    func updateTask(_ task: Task)
    func deleteTask(_ task: Task)
    func toggleCompletion(for task: Task)
    func filteredAndSortedTasks() -> [Task]
}
```

#### 3. **Görünümler**
- **TaskListView**: Tüm görevleri görüntüleyen ana görünüm
- **TaskRowView**: Listedeki bireysel görev öğesi
- **AddTaskView**: Yeni görev oluşturma formu
- **TaskDetailView**: Detaylı görünüm ve düzenleme arayüzü
- **SettingsView**: Uygulama ayarları ve tercihler
- **StatisticsView**: Görev istatistikleri ve içgörüler

#### 4. **Kalıcılık Katmanı**
```swift
class TaskStore {
    private let userDefaultsKey = "savedTasks"
    
    func loadTasks() -> [Task]
    func saveTasks(_ tasks: [Task])
    func clearAllTasks()
}
```

---

## 🚀 Kurulum {#kurulum-tr}

### Ön Koşullar

- **Xcode 14+**
- **iOS 15.0+**
- **Swift 5.9+**
- **macOS 12.0+** (geliştirme için)

### Kurulum Adımları

1. **Depoyu Klonlayın**
```bash
git clone https://github.com/malisevdinoglu/ToDosApp__Swift-UI.git
cd ToDosApp__Swift-UI
```

2. **Xcode'da Açın**
```bash
open ToDosApp.xcodeproj
```

3. **İmzalamayı Yapılandırın**
   - `Signing & Capabilities` bölümünde geliştirme ekibinizi seçin
   - Gerekirse Bundle Identifier'ı güncelleyin
   - Uygun provisioning profile olduğundan emin olun

4. **Derleyin ve Çalıştırın**
   - iOS 15+ Simülatör veya fiziksel cihaz seçin
   - Derlemek ve çalıştırmak için `Cmd + R` tuşlarına basın
   - Görevlerinizi yönetmeye başlayın!

### Harici Bağımlılık Yok
Bu proje sadece yerel iOS framework'lerini kullanır - üçüncü taraf kütüphane gerekmez!

---

## 📱 Kullanım

### Görev Ekleme

1. **"+" Düğmesine Dokunun**
   - Görev listesinin sağ üstünde bulunur
   - Görev Ekle formunu açar

2. **Görev Detaylarını Doldurun**
   ```
   Başlık: Market alışverişi (Zorunlu)
   Açıklama: Süt, ekmek, yumurta (İsteğe bağlı)
   Kategori: Alışveriş
   Öncelik: Orta
   Son Tarih: Yarın
   ```

3. **Kaydet**
   - "Kaydet" düğmesine dokunun
   - Görev anında listenizde görünür

### Görevleri Yönetme

#### **Tamamlandı Olarak İşaretle**
- Görevin yanındaki onay kutusuna dokunun
- Tamamlanan görevler üstü çizili metin ile gösterilir
- Tamamlanan bölüme taşınır (filtreleme etkinse)

#### **Görev Düzenle**
- Detayları açmak için herhangi bir göreve dokunun
- Herhangi bir alanı değiştirin
- Değişiklikler otomatik olarak kaydedilir

#### **Görev Sil**
- Görev üzerinde sola kaydırın
- Kırmızı silme düğmesine dokunun
- Veya toplu silme için Düzenle modunu kullanın

### Görevleri Organize Etme

#### **Görevleri Filtrele**
```
Tüm Görevler: Her şeyi göster
Aktif: Sadece tamamlanmamış görevler
Tamamlandı: Sadece bitmiş görevler
```

#### **Görev Ara**
- Üstteki arama çubuğunu kullanın
- Başlık ve açıklamada arama yapar
- Sonuçlar gerçek zamanlı güncellenir

#### **Görevleri Sırala**
```
Tarihe Göre: En yeni veya en eski önce
Önceliğe Göre: Yüksekten düşüğe
Başlığa Göre: Alfabetik sıra
Son Tarihe Göre: Yaklaşan son tarihler önce
```

### Kategoriler ve Öncelikler

#### **Kategoriler**
- İş: Profesyonel görevler
- Kişisel: Özel işler
- Alışveriş: Satın alma listeleri
- Sağlık: Fitness ve tıbbi
- Diğer: Çeşitli

#### **Öncelik Seviyeleri**
🔴 **Yüksek**: Acil, önemli görevler
🟡 **Orta**: Normal öncelik
🟢 **Düşük**: Bekleyebilir, olması güzel

---

## 🛠️ Teknoloji Yığını {#teknoloji-yığını-tr}

| Kategori | Teknoloji | Amaç |
|----------|-----------|------|
| **UI Framework** | SwiftUI | Modern bildirimsel UI |
| **Mimari** | MVVM | Temiz kod organizasyonu |
| **Programlama Dili** | Swift 5.9+ | Tip güvenli geliştirme |
| **Veri Kalıcılığı** | UserDefaults / Core Data | Yerel depolama |
| **Durum Yönetimi** | @State, @Binding, @ObservableObject | Reaktif güncellemeler |
| **Eşzamanlılık** | Async/Await (gerekirse) | Arka plan işlemleri |
| **Tasarım Desenleri** | Repository, Singleton | Kod yapısı |
| **Test** | XCTest | Birim testleri |

### Kullanılan Swift Özellikleri
- **SwiftUI**: Bildirimsel UI framework'ü
- **Property Wrappers**: @State, @Binding, @StateObject
- **Combine**: Reaktif programlama (opsiyonel)
- **Codable**: JSON kodlama/çözme
- **Identifiable**: Liste yönetimi
- **Enumlar**: Tip güvenli kategoriler ve öncelikler
- **Computed Properties**: Dinamik veri
- **Extensions**: Kod organizasyonu

---

## 📂 Proje Yapısı

```
ToDosApp/
├── ToDosApp.swift              # Uygulama giriş noktası
│
├── Models/
│   ├── Task.swift              # Görev veri modeli
│   ├── Category.swift          # Kategori enum
│   ├── Priority.swift          # Öncelik seviyeleri
│   └── FilterOption.swift      # Filtre türleri
│
├── ViewModels/
│   ├── TaskListViewModel.swift # Ana liste mantığı
│   ├── AddTaskViewModel.swift  # Görev ekleme mantığı
│   └── StatisticsViewModel.swift # İstatistikler
│
├── Views/
│   ├── TaskListView.swift      # Ana görev listesi
│   ├── TaskRowView.swift       # Görev liste öğesi
│   ├── AddTaskView.swift       # Ekle/Düzenle formu
│   ├── TaskDetailView.swift    # Görev detayları
│   ├── SettingsView.swift      # Uygulama ayarları
│   ├── StatisticsView.swift    # İstatistik panosu
│   └── EmptyStateView.swift    # Boş durum
│
├── Components/
│   ├── CustomCheckbox.swift    # Onay kutusu bileşeni
│   ├── PriorityBadge.swift     # Öncelik göstergesi
│   ├── CategoryBadge.swift     # Kategori etiketi
│   ├── DatePickerField.swift   # Tarih seçici
│   └── SearchBarView.swift     # Arama çubuğu
│
├── Services/
│   ├── TaskStore.swift         # Kalıcılık katmanı
│   └── NotificationManager.swift # Yerel bildirimler
│
├── Utilities/
│   ├── Extensions/
│   │   ├── Date+Extension.swift    # Tarih yardımcıları
│   │   ├── Color+Extension.swift   # Özel renkler
│   │   └── View+Extension.swift    # Görünüm değiştiricileri
│   ├── Constants.swift         # Uygulama sabitleri
│   └── Helpers.swift           # Yardımcı fonksiyonlar
│
└── Resources/
    ├── Assets.xcassets         # Görseller ve renkler
    ├── Localizable.strings     # Çeviriler
    └── Info.plist              # Uygulama yapılandırması
```

---

## 🐛 Sorun Giderme

### Yaygın Sorunlar

**Sorun**: Görevler uygulama yeniden başlatıldıktan sonra kalıcı olmuyor
**Çözüm**: 
```swift
// Görevlerin UserDefaults'a kaydedildiğinden emin olun
func saveTasks() {
    if let encoded = try? JSONEncoder().encode(tasks) {
        UserDefaults.standard.set(encoded, forKey: "savedTasks")
    }
}
```

**Sorun**: Görevler silinirken uygulama çöküyor
**Çözüm**:
- Uygun dizi indeks yönetimini kontrol edin
- List'te `.onDelete` modifier'ını doğru kullanın
- Durum güncellemelerinin ana thread'de olduğundan emin olun

**Sorun**: Tarih seçici görünmüyor
**Çözüm**:
- iOS versiyon uyumluluğunu doğrulayın (15+)
- DatePicker yapılandırmasını kontrol edin
- Uygun durum bağlamasını sağlayın

**Sorun**: Arama çalışmıyor
**Çözüm**:
- searchText bağlamasını doğrulayın
- Büyük/küçük harf duyarlılığı için filtre mantığını kontrol edin
- Arama değiştiğinde görünümün güncellendiğinden emin olun

**Sorun**: Koyu mod renkleri yanlış
**Çözüm**:
- Assets.xcassets'te renk varlıklarını tanımlayın
- Hem açık hem koyu varyantları ayarlayın
- Sabit kodlu renkler yerine Color("ColorName") kullanın

---

## 🗺️ Yol Haritası

### Planlanan Özellikler

- [ ] iCloud ile **Bulut Senkronizasyonu**
- [ ] **Alt Görevler** ve görev bağımlılıkları
- [ ] **Tekrarlayan Görevler** (günlük, haftalık, aylık)
- [ ] Yerel bildirimlerle **Hatırlatıcılar**
- [ ] Daha iyi organizasyon için **Etiket** sistemi
- [ ] **İşbirliği** - görevleri başkalarıyla paylaş
- [ ] Ana ekran için **Widget'lar**
- [ ] **Apple Watch** yardımcı uygulaması
- [ ] **Siri Kısayolları** entegrasyonu
- [ ] Görevleri **Dışa/İçe Aktar** (JSON, CSV)
- [ ] **Tema** özelleştirme
- [ ] Tekrarlayan desenler için **Görev Şablonları**
- [ ] Grafiklerle **Üretkenlik Analitikleri**
- [ ] Görevler için **Zaman Takibi**
- [ ] **Ekler** (fotoğraflar, dosyalar)
- [ ] Hızlı görev girişi için **Sesli Giriş**

### UI/UX İyileştirmeleri

- [ ] Geliştirilmiş animasyonlar ve geçişler
- [ ] Etkileşimler için dokunsal geri bildirim
- [ ] Hızlı eylemler için kaydırma hareketleri
- [ ] Sürükle bırak yeniden sıralama
- [ ] Özelleştirilebilir görev görünümleri (liste, ızgara, pano)
- [ ] Kategoriler için renk kodlama
- [ ] İlerleme göstergeleri
- [ ] Tamamlamada konfeti animasyonu
- [ ] Geri al/yeniden yap işlevselliği
- [ ] Klavye kısayolları (iPad)

### Teknik İyileştirmeler

- [ ] Birim testleri kapsamı
- [ ] UI testleri otomasyonu
- [ ] Core Data geçişi
- [ ] SwiftData benimseme (iOS 17+)
- [ ] Performans optimizasyonu
- [ ] Erişilebilirlik iyileştirmeleri
- [ ] Yerelleştirme (birden fazla dil)
- [ ] Hata işleme iyileştirmesi
- [ ] Kod dokümantasyonu
- [ ] CI/CD pipeline

---

## 📄 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için [LICENSE](LICENSE) dosyasına bakın.

```
MIT Lisansı

Telif Hakkı (c) 2024 Erdem Maliş

İzin, bu yazılımın ve ilişkili dokümantasyon dosyalarının ("Yazılım") bir kopyasını 
alan herhangi bir kişiye, Yazılım'ı kullanma, kopyalama, değiştirme, birleştirme, 
yayınlama, dağıtma, alt lisanslama ve/veya satma hakları dahil olmak üzere, 
sınırlama olmaksızın Yazılım'da işlem yapma izni ücretsiz olarak verilir.
```

---

## 🤝 Katkıda Bulunma

Katkılar memnuniyetle karşılanır! Bu bir öğrenme projesidir ve iyileştirmeler teşvik edilir.

### Nasıl Katkıda Bulunulur

1. Depoyu fork edin
2. Özellik dalı oluşturun (`git checkout -b feature/HarikaBirOzellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Harika bir özellik ekle'`)
4. Dalınıza push edin (`git push origin feature/HarikaBirOzellik`)
5. Pull Request açın

### Katkı Fikirleri

- Yol haritasından yeni özellikler ekle
- UI/UX tasarımını iyileştir
- Birim testleri yaz
- Hataları düzelt
- Dokümantasyonu iyileştir
- Yerelleştirme ekle
- Performansı optimize et

---

## 🙏 Teşekkürler

- **Apple**: SwiftUI framework'ü ve mükemmel dokümantasyon
- **iOS Geliştirme Topluluğu**: Eğitimler ve en iyi uygulamalar
- **Tasarım İlhamı**: Modern görev yönetimi uygulamaları
- **Açık Kaynak Topluluğu**: Kod örnekleri ve desenler

---

## 📧 İletişim

**Geliştirici**: 

- GitHub: [@malisevdinoglu](https://github.com/malisevdinoglu)
- LinkedIn: [Mehmet Ali Sevdinoglu](https://linkedin.com/in/erdem-malis)
- E-posta: [GitHub üzerinden iletişim](https://github.com/malisevdinoglu)

---

<div align="center">

**⭐ Bu projeyi yararlı buluyorsanız, lütfen yıldız vermeyi düşünün!**

💻 ve ☕ ile [Mehmet Ali Sevdinoglu](https://github.com/malisevdinoglu) tarafından yapılmıştır

**SwiftUI • Görev Yönetimi • iOS**

</div>
