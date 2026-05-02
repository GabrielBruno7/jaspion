CREATE TABLE student (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
    phone_number VARCHAR(30) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    observations TEXT,
    address VARCHAR(255) NOT NULL,
    number VARCHAR(20) NOT NULL,
    neighborhood VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE modality (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

create table graduation (
    id BIGSERIAL PRIMARY KEY,
    modality_id BIGINT NOT NULL REFERENCES modality(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL UNIQUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    UNIQUE(modality_id, name)
);

CREATE TABLE plan (
    id BIGSERIAL PRIMARY KEY,
    modality_id BIGINT NOT NULL REFERENCES modality(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    month_price DECIMAL(10, 2) NOT NULL CHECK (month_price >= 0),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    UNIQUE(modality_id, name)
);

CREATE TABLE enrollment (
    id BIGSERIAL PRIMARY KEY,
    student_id BIGINT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_day INT NOT NULL CHECK (due_day BETWEEN 1 AND 31),
    closure_date DATE NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'CLOSED', 'CANCELED')) DEFAULT 'ACTIVE'
);

CREATE TABLE enrollment_modality (
    id BIGSERIAL PRIMARY KEY,
    enrollment_id BIGINT NOT NULL REFERENCES enrollment(id) ON DELETE CASCADE,
    modality_id BIGINT NOT NULL REFERENCES modality(id) ON DELETE CASCADE,
    graduation_id BIGINT NOT NULL REFERENCES graduation(id) ON DELETE CASCADE,
    plan_id BIGINT NOT NULL REFERENCES plan(id) ON DELETE CASCADE,
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date DATE NULL,
    UNIQUE(enrollment_id, modality_id)
);

CREATE TABLE payment (
    id BIGSERIAL PRIMARY KEY,
    enrollment_id BIGINT NOT NULL REFERENCES enrollment(id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('PAID', 'PENDING', 'OVERDUE', 'CANCELED')) DEFAULT 'PENDING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    UNIQUE(enrollment_id, due_date)
);

CREATE TABLE attendance (
    id BIGSERIAL PRIMARY KEY,
    enrollment_id BIGINT NOT NULL REFERENCES enrollment(id) ON DELETE CASCADE,
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date DATE NULL
);
