-- Xóa dữ liệu cũ để tránh trùng khóa chính
DELETE FROM users_students;
DELETE FROM class_room;
DELETE FROM users_teachers;
DELETE FROM users_admin;
DELETE FROM subject;
DELETE FROM room;
DELETE FROM period;
DELETE FROM exam_schedule;
DELETE FROM schedule;

-- ===========================
-- Dữ liệu mẫu cho training_system
-- ===========================
-- admin
-- -- Tạo bảng users_admin (nếu chưa có)
-- CREATE TABLE IF NOT EXISTS users_admin (
--   id BIGSERIAL PRIMARY KEY,
--   username VARCHAR(255) UNIQUE NOT NULL,
--   password VARCHAR(255) NOT NULL,
--   role VARCHAR(255) NOT NULL,
--   email VARCHAR(255) UNIQUE,
--   phone VARCHAR(255) UNIQUE,
--   image_url VARCHAR(255)
-- );

-- -- Thêm dữ liệu admin mẫu
-- INSERT INTO users_admin (id, username, password, role, email, phone, image_url) VALUES
-- (3, 'viu106018', '$2a$10$GLGXwjVpn.dznkwxOsz6iOM9dVMg/JfHa0R8ay48VYibIPA6SmD8u', 'ROLE_ADMIN', 'viu106018@donga.edu.vn', '0367604684', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fstarmanh%2Favatar-facebook%2F&psig=AOvVaw2sm0f-iaWQQze72W4YuLAu&ust=1748957676635000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMDus5vt0o0DFQAAAAAdAAAAABAE'),
-- (5, 'viu852005', '$2a$12$axP4gVxYOqfERUSuXHQYu.9RmoZ3VsGDMtoVC/d9ns4AmS2.Ql7p6', 'ROLE_ADMIN', 'viuadmin@donga.edu.vn', '0367604685', 'https://i.pinimg.com/200x/c5/b9/ff/c5b9ffb0d6e4fad7e6f7df27f9545a93.jpg'),
-- (6, 'temp_admin', '$2a$10$1c0sC4c2n3KeOM4CU22L2u9Pd6RL8gDe0KLPO9xlz7oszrVndgqwq', 'ROLE_ADMIN', 'temp.admin@example.com', NULL, NULL);

-- -- 1. Giảng viên (users_teachers)
INSERT INTO users_teachers (
    id, avatar, created_at, degree, department, email, full_name,
    position, status, username, password, role, phone
) VALUES
    (3, 'https://moc247.com/wp-content/uploads/2023/12/loa-mat-voi-101-hinh-anh-avatar-meo-cute-dang-yeu-dep-mat_1-1.jpg', '2025-06-01', 'Thạc sĩ', 'Tổ Văn', 'rmahviu@tranning.edu.vn', 'Rmah Viu', 'Giáo viên', 'Đang công tác', 'rmahviu123', '$2a$10$KwUsWOnG1jCnbwvEJZx87OGtkuYnExFRXKkvaegyy.Ggo3n.VXwye', 'TEACHER', NULL),
    (4, 'https://moc247.com/wp-content/uploads/2023/12/loa-mat-voi-101-hinh-anh-avatar-meo-cute-dang-yeu-dep-mat_2.jpg', '2025-06-01', 'Tiến sĩ', 'Tổ Lý', 'hoaianhgv@tranning.edu.vn', 'Nguễn Thi Hoài Trang', 'Hiệu trưởng', 'Đang công tác', 'hoaianhgv', '$2a$10$sVl0dJbo5uYPGCsopYo/8e7y0cfU.o686lvnA2pBc4p9z6a/99NoO', 'TEACHER', NULL);

-- -- 2. Quản trị viên (users_admin)
-- INSERT INTO users_admin (
--     id, username, password, role, email, phone, image_url
-- ) VALUES
--     (3, 'viu106018', '$2a$10$GLGXwjVpn.dznkwxOsz6iOM9dVMg/JfHa0R8ay48VYibIPA6SmD8u', 'ADMIN', 'viu106018@donga.edu.vn', '0367604684', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fstarmanh%2Favatar-facebook%2F&psig=AOvVaw2sm0f-iaWQQze72W4YuLAu&ust=1748957676635000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMDus5vt0o0DFQAAAAAdAAAAABAE'),
--     (5, 'viu852005', '$2a$12$axP4gVxYOqfERUSuXHQYu.9RmoZ3VsGDMtoVC/d9ns4AmS2.Ql7p6', 'ADMIN', 'viuadmin@donga.edu.vn', '0367604685', 'https://i.pinimg.com/200x/c5/b9/ff/c5b9ffb0d6e4fad7e6f7df27f9545a93.jpg'),
--     (6, 'temp_admin', '$2a$10$1c0sC4c2n3KeOM4CU22L2u9Pd6RL8gDe0KLPO9xlz7oszrVndgqwq', 'ADMIN', 'temp.admin@example.com', NULL, NULL);

-- 3. Lớp học (class_room)
-- Bỏ cột subject vì bảng class_room không có cột này trong PostgreSQL
INSERT INTO class_room (
    id, name, grade, academic_year, code,
    description, homeroom_teacher_id
) VALUES
    (2, '12A1', '12', '2023-2025', '760616', '', 4),
    (3, '12A2', '12', '2023-2028', '00920', '', 3);

-- -- 4. Học sinh (users_students)
-- -- ĐÚNG CHUẨN: 32 cột (id + 30 trường dữ liệu + class_room_id)
-- INSERT INTO users_students (
--     id, full_name, student_code, username, email, phone, gender, major, course, classroom, status, enrollment_date, password, role,
--     date_of_birth, address, avatar_url, birth_place, identity_number, identity_issue_date, identity_issue_place, ethnicity, religion, nationality,
--     father_name, father_job, father_phone, mother_name, mother_job, mother_phone, class_room_id
-- ) VALUES
--     (4, 'Lệ Thị Hoài Anh', 'K240003', 'hoaianh003', 'hoaianh@tranning.edu.vn', '0367604684', 'Nữ', NULL, '2023-2025', '', 'Bảo lưu', '2025-07-02',
--      '$2a$10$AMA/Gj8Q.cdkI//J3.E/8ObswTVXstDj4ZgkJLb50kf.MEUUql9GC', 'STUDENT',
--      NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
--      NULL, NULL, NULL, NULL, NULL, NULL, 2),

--     (5, 'Nguyễn Văn Quy', 'K0001', 'vanquy001', 'vanquy001@tranning.edu.vn', '0367604684', 'Nam', 'Văn', '2023-2025', '', 'Đang học', '2025-07-02',
--      '$2a$10$lrX/NQy12rzZROaPkQYs7u1jasRu.y/VVKvsJbd5EdEdNeK79dyhi', 'STUDENT',
--      NULL, '', 'https://cellphones.com.vn/sforum/wp-content/uploads/2023/11/avatar-vo-tri-54.jpg', 'Gia Lai', '', NULL, '', 'Kinh', 'Không', 'Việt Nam',
--      'Nguyễn Văn A', '', '0123456789', 'Nguyễn Thị B', '', '0123456789', 2),

--     (6, 'Rmah Viu', 'K0005', 'rmahviu005', 'rmahviu005@tranning.edu.vn', '0367604684', 'Nam', 'Văn', '2023-2025', '', 'Đang học', '2022-02-02',
--      '$2a$10$3rvaqhoRFDUHWUxF0CMro.r7qlzhm672t36rs2ZpE5BfTPwngAaXS', 'STUDENT',
--      NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
--      NULL, NULL, NULL, NULL, NULL, NULL, 2),

--     (7, 'Lê Thị Hậu', 'K0006', 'thihau006', 'thihau006@tranning.edu.vn', '0367604684', 'Nữ', NULL, NULL, '', 'Đang học', '2025-06-04',
--      '$2a$10$ANNBR/p/7zbCN806EBuR7O78kQxCsBTROaz6LRaf1AQoToMlQ7HXG', 'STUDENT',
--      '2025-06-05', 'Số 84, Phan Trọng Tuệ', 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-1.jpg', 'Gia Lai', '00000000076', NULL, '', 'Jrai', 'Không', 'Việt Nam',
--      'Nguyễn Văn A', '', '0123456789', 'Nguyễn Thị B', '', '0123456789', 3);


-- 5. Môn học (subject)
INSERT INTO subject (id, name) VALUES
    (1, 'Toán'),
    (2, 'Văn'),
    (3, 'Anh'),
    (4, 'Lý'),
    (5, 'Hóa'),
    (6, 'Sinh'),
    (7, 'Sử'),
    (8, 'Địa'),
    (9, 'GDCD'),
    (10, 'Tin học'),
    (11, 'Công nghệ'),
    (12, 'Thể dục'),
    (13, 'Quốc phòng');

-- 6. Phòng học (room)
INSERT INTO room (id, name) VALUES
    (101, 'Phòng 101'),
    (102, 'Phòng 102'),
    (103, 'Phòng 103'),
    (104, 'Phòng 104'),
    (105, 'Phòng 105'),
    (201, 'Phòng 201'),
    (202, 'Phòng 202'),
    (203, 'Phòng 203'),
    (204, 'Phòng 204'),
    (205, 'Phòng 205'),
    (301, 'Phòng 301'),
    (302, 'Phòng 302'),
    (303, 'Phòng 303'),
    (304, 'Phòng 304'),
    (305, 'Phòng 305'),
    (401, 'Phòng 401'),
    (402, 'Phòng 402'),
    (403, 'Phòng 403'),
    (404, 'Phòng 404'),
    (405, 'Phòng 405'),
    (501, 'Phòng 501'),
    (502, 'Phòng 502'),
    (503, 'Phòng 503'),
    (504, 'Phòng 504'),
    (505, 'Phòng 505');

-- 7. Ca học (period)
INSERT INTO period (id, end_time, name, start_time) VALUES
    (1, '07:45', 'Tiết 1', '07:00'),
    (2, '08:35', 'Tiết 2', '07:50'),
    (3, '09:25', 'Tiết 3', '08:40'),
    (4, '10:25', 'Tiết 4', '09:40'),
    (5, '11:15', 'Tiết 5', '10:30'),
    (6, '13:45', 'Tiết 6', '13:00'),
    (7, '14:35', 'Tiết 7', '13:50'),
    (8, '15:25', 'Tiết 8', '14:40'),
    (9, '16:25', 'Tiết 9', '15:40'),
    (10, '17:15', 'Tiết 10', '16:30');

-- 8. Lịch thi (exam_schedule)
INSERT INTO exam_schedule (
    id, classes, end_time, number_of_students, rooms, start_time, status, subject
) VALUES
    (1, '12A1', '2025-06-07 14:14:00', 3, 'Phòng 202', '2025-06-07 09:14:00', 'Chờ thi', 'Văn');

-- 9. Thời khóa biểu (schedule)
INSERT INTO schedule (
    id, date, class_id, period_id, room_id, subject_id, teacher_id
) VALUES
    (1, '2025-06-04', 2, 3, 203, 3, 3),
    (2, '2025-06-06', 2, 5, 303, 6, 4),
    (3, '2025-06-06', 3, 1, 204, 10, 4);
