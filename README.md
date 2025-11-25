# CoreData-LightWeight-Migration
A beginner-friendly iOS project demonstrating Core Data CRUD with automatic Lightweight Migration. Includes sample entity evolution across versions without data loss.
# CoreData-Migrate 🚀

A clean and beginner-friendly iOS sample demonstrating **Core Data CRUD with Automatic Lightweight Migration**.

## 📌 Features
- CRUD operations using Core Data
- `NSPersistentContainer` based Core Data stack
- Automatic **Lightweight Migration**
- Demonstrates model version upgrade without losing data
- SwiftUI UI for simplicity

## 🧬 Lightweight Migration Demo
Entity: `Person`

| Version | Attributes |
|--------|------------|
| v1 | `name (String)` |
| v2 | `name (String)`, `age (Integer 16)` |

The app automatically migrates data from v1 → v2 without manual mapping models.

## 🏗 Tech Stack
- Swift
- SwiftUI
- Core Data
- Xcode 15+

## ▶️ How to Test Migration
1. Run project with **V1 model** → Add sample persons
2. Switch to **V2 model** (adds attribute `age`)
3. Run again → All existing records preserved ✔
