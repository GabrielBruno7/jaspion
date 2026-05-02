INSERT INTO modality (name) VALUES
('Karate'),
('Judo'),
('Taekwondo'),
('Kung Fu'),
('Bodybuilding');

INSERT INTO graduation (modality_id, name) VALUES
(1, 'White Belt Karate'),
(1, 'Yellow Belt Karate'),
(1, 'Orange Belt Karate'),
(2, 'White Belt Judo'),
(2, 'Yellow Belt Judo'),
(2, 'Orange Belt Judo'),
(3, 'White Belt Taekwondo'),
(3, 'Yellow Belt Taekwondo'),
(3, 'Orange Belt Taekwondo'),
(4, 'Beginner Kung Fu'),
(4, 'Intermediate Kung Fu'),
(4, 'Advanced Kung Fu'),
(5, 'Beginner Bodybuilding'),
(5, 'Intermediate Bodybuilding'),
(5, 'Advanced Bodybuilding');

INSERT INTO plan (modality_id, name, month_price) VALUES
(1, 'Basic', 100.00),
(1, 'Premium', 150.00),
(2, 'Basic', 120.00),
(2, 'Premium', 180.00),
(3, 'Basic', 110.00),
(3, 'Premium', 160.00),
(4, 'Basic', 130.00),
(4, 'Premium', 190.00),
(5, 'Basic', 90.00),
(5, 'Premium', 140.00);

INSERT INTO student (
	name,
	birth_date,
	gender,
	phone_number,
	email,
	observations,
	address,
	number,
	neighborhood,
	city,
	state,
	zip_code
) VALUES
('Ana Silva', '2001-04-18', 'F', '11988887777', 'ana.silva@example.com', 'Prefers evening classes', 'Rua das Palmeiras', '120', 'Centro', 'Sao Paulo', 'SP', '01000-000'),
('Bruno Souza', '1998-09-02', 'M', '21997776666', 'bruno.souza@example.com', 'Recovering from knee injury', 'Av. Atlantica', '450', 'Copacabana', 'Rio de Janeiro', 'RJ', '22010-000'),
('Carla Lima', '2005-01-30', 'F', '31996665555', 'carla.lima@example.com', NULL, 'Rua da Bahia', '999', 'Savassi', 'Belo Horizonte', 'MG', '30160-011');

INSERT INTO enrollment (student_id, enrollment_date, due_day, closure_date, status) VALUES
(1, '2026-01-10', 10, NULL, 'ACTIVE'),
(2, '2026-02-05', 5, NULL, 'ACTIVE'),
(3, '2026-03-12', 12, NULL, 'ACTIVE');

INSERT INTO enrollment_modality (
	enrollment_id,
	modality_id,
	graduation_id,
	plan_id,
	start_date,
	end_date
) VALUES
(1, 1, 1, 2, '2026-01-10', NULL),
(2, 2, 4, 3, '2026-02-05', NULL),
(3, 5, 13, 9, '2026-03-12', NULL);

INSERT INTO payment (
	enrollment_id,
	amount,
	payment_date,
	due_date,
	status
) VALUES
(1, 150.00, '2026-01-10', '2026-01-10', 'PAID'),
(1, 150.00, '2026-02-10', '2026-02-10', 'PAID'),
(2, 120.00, '2026-02-05', '2026-02-05', 'PAID'),
(2, 120.00, '2026-03-05', '2026-03-05', 'PENDING'),
(3, 90.00, '2026-03-12', '2026-03-12', 'PAID'),
(3, 90.00, '2026-04-12', '2026-04-12', 'PENDING');

INSERT INTO attendance (enrollment_id, start_date, end_date) VALUES
(1, '2026-01-10', NULL),
(2, '2026-02-05', NULL),
(3, '2026-03-12', NULL);