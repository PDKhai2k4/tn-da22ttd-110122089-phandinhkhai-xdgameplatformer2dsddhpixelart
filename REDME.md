# Xây dựng Game Platformer 2D sử dụng đồ họa Pixel Art

Đồ án tốt nghiệp với mục tiêu xây dựng một trò chơi **Platformer 2D** sử dụng **Godot Engine** và phong cách đồ họa **Pixel Art**. Người chơi điều khiển nhân vật vượt qua các màn chơi bằng cách di chuyển, nhảy, tránh chướng ngại vật, thu thập vật phẩm và hoàn thành mục tiêu của từng màn.

---
## 📑 Mục lục

- [Mục tiêu](#mục-tiêu)
- [Kiến trúc dự án](#kiến-trúc-dự-án)
- [Công nghệ sử dụng](#công-nghệ-sử-dụng)
- [Phần mềm cần thiết](#phần-mềm-cần-thiết-để-triển-khai)
- [Cách triển khai dự án](#cách-triển-khai-dự-án)
- [Chạy chương trình](#chạy-chương-trình)
- [Điều khiển](#điều-khiển)
- [Tính năng nổi bật](#tính-năng-nổi-bật)
- [Yêu cầu hệ thống](#yêu-cầu-hệ-thống)
- [Tác giả](#tác-giả)

---

# Mục tiêu

- Xây dựng trò chơi Platformer 2D hoàn chỉnh trên nền tảng PC.
- Phát triển hệ thống điều khiển nhân vật với cơ chế di chuyển và nhảy mượt mà.
- Thiết kế nhiều màn chơi có độ khó tăng dần.
- Xây dựng các đối tượng trong game như:
  - Người chơi
  - Kẻ địch
  - Chướng ngại vật
  - Vật phẩm
  - Checkpoint
  - Cơ quan tương tác
- Áp dụng phong cách đồ họa Pixel Art để tạo sự đồng nhất về hình ảnh.
- Tích hợp hiệu ứng âm thanh và nhạc nền nhằm nâng cao trải nghiệm người chơi.
- Tối ưu hiệu năng và cấu trúc dự án để thuận tiện cho việc phát triển và mở rộng.

---

# Kiến trúc dự án

```
Platformer2D/
│
├── scenes/          # Các Scene của trò chơi
├── scripts/         # Mã nguồn GDScript
├── sprites/         # Hình ảnh Pixel Art
├── stages/          # Các màn chơi
├── sounds/          # Nhạc nền và hiệu ứng âm thanh
├── project.godot    # File cấu hình dự án
└── README.md
```
## Các thành phần chính

### Người chơi

- Di chuyển trái/phải
- Nhảy
- Xử lý va chạm
- Hoạt ảnh

### Kẻ địch

- Tuần tra
- Đổi hướng
- Gây sát thương

### Bẫy

- Gai
- Hố
- Vùng nguy hiểm

### Item

- Coin
- Key

### Checkpoint

- Lưu tiến trình
- Hồi sinh người chơi

### Cơ quan

- Công tắc
- Cửa
- Nền tảng di chuyển

### UI

- Main Menu
- Pause
- Setting
- Game Over
- Victory

---

# Công nghệ sử dụng

| Công nghệ | Mục đích |
|-----------|----------|
| Godot Engine 4.x | Phát triển trò chơi |
| GDScript | Lập trình gameplay |
| Krita | Thiết kế Pixel Art |
| Audacity | Xử lý âm thanh |
| Git | Quản lý mã nguồn |
| GitHub | Lưu trữ dự án |

---

# Phần mềm cần thiết để triển khai

Trước khi chạy dự án cần cài đặt:

## 1. Godot Engine

Khuyến nghị:

- Godot Engine **4.4.x** hoặc phiên bản tương thích với dự án.

Tải tại:

https://godotengine.org/download

---

## 2. Git

Dùng để clone mã nguồn.

Tải tại:

https://git-scm.com/downloads

---

## 3. (Khuyến nghị) Visual Studio Code

Có thể dùng để chỉnh sửa GDScript.

Tải tại:

https://code.visualstudio.com/

---
## 4. Krita

Có thể dùng để thiết kế Pixel Art.

Tải tại:

https://krita.org/en/
---
## 5. Audacity

Có thể dùng để xử lý âm thanh.

Tải tại:

https://www.audacityteam.org/
---
# Cách triển khai dự án

## Clone repository

```bash
git clone https://github.com/PDKhai2k4/tn-da22ttd-110122089-phandinhkhai-xdgameplatformer2dsddhpixelart.git
```

Di chuyển vào thư mục dự án:

```bash
cd src
```

---

## Mở dự án

1. Khởi động Godot Engine.
2. Chọn **Import**.
3. Chọn file:

```
project.godot
```

4. Nhấn **Import & Edit**.

---

# Chạy chương trình

Sau khi mở dự án trong Godot:

- Nhấn nút **Run Project** (▶)
- Hoặc sử dụng phím tắt:

```
F5
```

Godot sẽ biên dịch và chạy trò chơi.

---

# Điều khiển

| Phím | Chức năng |
|------|-----------|
| ← → / A D | Di chuyển |
| Space | Nhảy |
| Esc | Tạm dừng trò chơi |

> Lưu ý: Các phím điều khiển có thể được thay đổi trong **Project Settings → Input Map**.

---

# Tính năng nổi bật

- Gameplay Platformer 2D.
- Điều khiển nhân vật mượt mà.
- Hệ thống Checkpoint.
- Hệ thống vật phẩm.
- Kẻ địch tuần tra.
- Chướng ngại vật.
- Cơ quan tương tác.
- Pixel Art.
- Hiệu ứng âm thanh và nhạc nền.

---

# Yêu cầu hệ thống

## Tối thiểu

- Windows 10/11
- CPU Intel Core i3 hoặc tương đương
- RAM 4 GB
- GPU hỗ trợ OpenGL/Vulkan
- Dung lượng trống khoảng 500 MB

## Khuyến nghị

- Windows 11
- Intel Core i5 trở lên
- RAM 8 GB
- SSD

---

# Tác giả

**Phan Đình Khải**
- MSSV: 110122089
- Lớp: DA22TTD
- Email: 110122089@st.tvu.edu.vn

Đồ án tốt nghiệp

Đại học Trà Vinh
Trường Kỹ thuật và Công nghệ

Giảng viên hướng dẫn: **ThS. Khấu Văn Nhựt**