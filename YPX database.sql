/*Bu database kimin masini hansidirsa, masinin suruculeri,qaydalar,cerimeler ve 
odenisler ve s/ 
meselen Shahin adli sürücü BMW masini ilə qaydani pozub - YPX 
emekdasi bunu yazır -  sistemə düşür-Elvinə cərimə gəlir -O da kartla ve ya nagd
ödəyir 
-bunun hamsini eyni sistemde qeyd etmek istedim
dusundumki, kursda cox telebe ya kurs,ya bank,ya kitabxana,market online sistemler
yazacaq ferqli birsey olsun deye arasdirib ele yazdim.
Crud emeliyyatlarinida etmisem joinler filan.
elave olaraq analytic functionlardanda istifade etmisem/
*/


CREATE TABLE drivers (
    driver_id           NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_driver_id PRIMARY KEY,
    first_name          VARCHAR2(50) NOT NULL,
    last_name           VARCHAR2(50) NOT NULL,
    license_number      VARCHAR2(20) UNIQUE NOT NULL,
    birth_date          DATE,
    license_issue_date  DATE,
    license_expiry_date DATE
);

CREATE TABLE vehicles (
    vehicle_id   NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_vehicle_id PRIMARY KEY,
    plate_number VARCHAR2(15) UNIQUE NOT NULL,
    model        VARCHAR2(50),
    brand        VARCHAR2(50),
    year         NUMBER(4),
    color        VARCHAR2(30),
    owner_id     NUMBER(7, 0) NOT NULL,
    CONSTRAINT fk_vehicle_owner FOREIGN KEY ( owner_id )
        REFERENCES drivers ( driver_id )
);

CREATE TABLE officers (
    officer_id   NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_officer_id PRIMARY KEY,
    badge_number VARCHAR2(50) UNIQUE NOT NULL,
    full_name    VARCHAR2(100) NOT NULL,
    rank         VARCHAR2(30),
    station_name VARCHAR2(50)
);

CREATE TABLE violations (
    violation_id   NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_violation_id PRIMARY KEY,
    driver_id      NUMBER(7, 0) NOT NULL,
    vehicle_id     NUMBER(7, 0) NOT NULL,
    violation_type VARCHAR2(100) NOT NULL,
    violation_date DATE DEFAULT sysdate,
    location       VARCHAR2(100),
    officer_id     NUMBER(7, 0),
    fine_amount    NUMBER(10, 2) CHECK ( fine_amount >= 0 ),
    paid           CHAR(1) DEFAULT 'N' CHECK ( paid IN ( 'Y', 'N' ) ),
    CONSTRAINT fk_violation_driver FOREIGN KEY ( driver_id )
        REFERENCES drivers ( driver_id ),
    CONSTRAINT fk_violation_vehicle FOREIGN KEY ( vehicle_id )
        REFERENCES vehicles ( vehicle_id ),
    CONSTRAINT fk_violation_officer FOREIGN KEY ( officer_id )
        REFERENCES officers ( officer_id )
);

CREATE TABLE payments (
    payment_id     NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_payment_id PRIMARY KEY,
    violation_id   NUMBER(7, 0) NOT NULL,
    payment_date   DATE DEFAULT sysdate,
    amount_paid    NUMBER(10, 2) CHECK ( amount_paid >= 0 ),
    payment_method VARCHAR2(20),
    CONSTRAINT fk_payment_violation FOREIGN KEY ( violation_id )
        REFERENCES violations ( violation_id )
);

CREATE TABLE vehicle_inspections (
    inspection_id   NUMBER(7, 0)
        GENERATED AS IDENTITY
        CONSTRAINT pk_inspection_id PRIMARY KEY,
    vehicle_id      NUMBER(7, 0) NOT NULL,
    inspection_date DATE NOT NULL,
    result          VARCHAR2(20) CHECK ( result IN ( 'passed', 'failed' ) ),
    next_due_date   DATE,
    CONSTRAINT fk_inspection_vehicle FOREIGN KEY ( vehicle_id )
        REFERENCES vehicles ( vehicle_id )
);


ALTER TABLE drivers ADD is_deleted CHAR(1) DEFAULT 'N' CHECK (is_deleted IN ('Y', 'N'));
select * from drivers;
UPDATE drivers SET is_deleted = 'Y' WHERE driver_id = 9;
SELECT * FROM drivers WHERE is_deleted = 'Y';
SELECT * FROM drivers WHERE is_deleted = 'N';




ALTER TABLE violations
DROP CONSTRAINT fk_violation_driver;

ALTER TABLE violations
ADD CONSTRAINT fk_violation_driver
    FOREIGN KEY (driver_id)
    REFERENCES drivers(driver_id)
    ON DELETE CASCADE;
    
    
    select * from violations;
DELETE FROM drivers WHERE driver_id = 9;

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Elvin',
           'Quliyev',
           'AZ1234567',
           DATE '1985-03-12',
           DATE '2020-01-10',
           DATE '2030-01-10' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Aysel',
           'Məmmədova',
           'AZ2233445',
           DATE '1990-07-22',
           DATE '2021-05-05',
           DATE '2031-05-05' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Rəşad',
           'Əliyev',
           'AZ9988776',
           DATE '1978-11-02',
           DATE '2019-08-15',
           DATE '2029-08-15' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Nigar',
           'Hüseynova',
           'AZ5566778',
           DATE '1995-02-18',
           DATE '2022-02-20',
           DATE '2032-02-20' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Orxan',
           'Kərimov',
           'AZ3344556',
           DATE '1988-05-10',
           DATE '2021-01-01',
           DATE '2031-01-01' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Leyla',
           'Əsədova',
           'AZ1234432',
           DATE '1992-09-19',
           DATE '2023-03-12',
           DATE '2033-03-12' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Murad',
           'Rzayev',
           'AZ7766554',
           DATE '1983-06-06',
           DATE '2020-06-01',
           DATE '2030-06-01' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Tural',
           'Məmmədli',
           'AZ6655443',
           DATE '1987-12-25',
           DATE '2022-01-01',
           DATE '2032-01-01' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Zəhra',
           'Əliyeva',
           'AZ1111222',
           DATE '1994-10-30',
           DATE '2021-10-01',
           DATE '2031-10-01' );

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Kamran',
           'Səfərov',
           'AZ8888999',
           DATE '1991-08-08',
           DATE '2020-08-01',
           DATE '2030-08-01' );

SELECT
    *
FROM
    drivers;

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-AA-123',
           'Corolla',
           'Toyota',
           2015,
           'ağ',
           1 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '90-AB-456',
           'Civic',
           'Honda',
           2018,
           'qara',
           2 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-GG-789',
           'Optima',
           'Kia',
           2017,
           'boz',
           3 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '99-AA-987',
           'E-Class',
           'Mercedes',
           2020,
           'göy',
           4 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '77-BA-654',
           '3 Series',
           'BMW',
           2016,
           'qırmızı',
           5 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-AB-111',
           'Polo',
           'Volkswagen',
           2019,
           'ağ',
           6 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '90-GG-222',
           'Sonata',
           'Hyundai',
           2021,
           'gümüşü',
           7 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-BB-333',
           'Focus',
           'Ford',
           2014,
           'yaşıl',
           8 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '99-CC-444',
           'Mazda 6',
           'Mazda',
           2015,
           'mavi',
           9 );

INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-XX-555',
           'X5',
           'BMW',
           2023,
           'qara',
           10 );

SELECT
    *
FROM
    vehicles;

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX001',
           'Elçin Qasımov',
           'leytenant',
           'Bakı' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX002',
           'Samir Abbasov',
           'kapitan',
           'Sumqayıt' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX003',
           'Rauf Məmmədov',
           'baş leytenant',
           'Gəncə' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX004',
           'Səbinə Nuriyeva',
           'leytenant',
           'Mingəçevir' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX005',
           'Kamil Əliyev',
           'kapitan',
           'Şəki' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX006',
           'Ramil Əhmədov',
           'polis serjantı',
           'Xaçmaz' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX007',
           'Nərmin Musayeva',
           'baş leytenant',
           'Quba' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX008',
           'Faiq Məlikov',
           'leytenant',
           'Lənkəran' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX009',
           'Aytac Səlimova',
           'polis serjantı',
           'Şəmkir' );

INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX010',
           'Emil Səfərov',
           'kapitan',
           'Zaqatala' );

SELECT
    *
FROM
    officers;

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 1,
           1,
           'Sürət həddi aşımı',
           'Bakı',
           1,
           50,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 2,
           2,
           'Qırmızı işıqda keçid',
           'Sumqayıt',
           2,
           70,
           'Y' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 3,
           3,
           'Kəmərsiz sürmə',
           'Gəncə',
           3,
           30,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 4,
           4,
           'Qadağan olunmuş yerdə dayanma',
           'Mingəçevir',
           4,
           40,
           'Y' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 5,
           5,
           'Mobil telefondan istifadə',
           'Şəki',
           5,
           60,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 6,
           6,
           'Vəsiqəsiz idarəetmə',
           'Xaçmaz',
           6,
           100,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 7,
           7,
           'Siqnal vermədən dönmə',
           'Quba',
           7,
           35,
           'Y' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 8,
           8,
           'Texniki baxışdan keçməyib',
           'Lənkəran',
           8,
           80,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 9,
           9,
           'Alkoqollu vəziyyətdə sürmə',
           'Şəmkir',
           9,
           150,
           'N' );

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 10,
           10,
           'Yol nişanlarına əməl etməmə',
           'Zaqatala',
           10,
           45,
           'Y' );

SELECT
    *
FROM
    violations;

INSERT INTO payments (
    violation_id,
    payment_date,
    amount_paid,
    payment_method
) VALUES ( 2,
           DATE '2024-01-15',
           70,
           'kart' );

INSERT INTO payments (
    violation_id,
    payment_date,
    amount_paid,
    payment_method
) VALUES ( 4,
           DATE '2024-02-10',
           40,
           'nağd' );

INSERT INTO payments (
    violation_id,
    payment_date,
    amount_paid,
    payment_method
) VALUES ( 7,
           DATE '2024-03-05',
           35,
           'bank' );

INSERT INTO payments (
    violation_id,
    payment_date,
    amount_paid,
    payment_method
) VALUES ( 10,
           DATE '2024-04-20',
           45,
           'kart' );

SELECT
    *
FROM
    payments;

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 1,
           DATE '2023-01-01',
           'passed',
           DATE '2025-01-01' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 2,
           DATE '2023-06-15',
           'failed',
           DATE '2024-06-15' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 3,
           DATE '2022-08-10',
           'passed',
           DATE '2024-08-10' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 4,
           DATE '2024-03-20',
           'passed',
           DATE '2026-03-20' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 5,
           DATE '2021-09-05',
           'failed',
           DATE '2022-09-05' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 6,
           DATE '2024-01-01',
           'passed',
           DATE '2026-01-01' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 7,
           DATE '2022-11-11',
           'passed',
           DATE '2024-11-11' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 8,
           DATE '2023-05-18',
           'failed',
           DATE '2024-05-18' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 9,
           DATE '2022-12-25',
           'passed',
           DATE '2024-12-25' );

INSERT INTO vehicle_inspections (
    vehicle_id,
    inspection_date,
    result,
    next_due_date
) VALUES ( 10,
           DATE '2023-07-01',
           'passed',
           DATE '2025-07-01' );

SELECT
    *
FROM
    vehicle_inspections;

UPDATE drivers
SET
    last_name = 'Səfərov'
WHERE
    license_number = 'AZ1234567';

SELECT
    *
FROM
    drivers;

UPDATE drivers
SET
    last_name = 'Mikayilov'
WHERE
    driver_id = 2;

SELECT  ---hansi surucunun avtomobil nomresi varsa onu goster birlesdirib bu join onun ucundur
    d.driver_id,
    d.first_name
    || ' '
    || d.last_name AS full_name,
    v.plate_number,
    v.brand,
    v.model
FROM
         drivers d
    JOIN vehicles v ON d.driver_id = v.owner_id;

SELECT
    v.violation_id,
    d.first_name
    || ' '
    || d.last_name AS driver,
    vh.plate_number,
    v.violation_type,
    v.fine_amount,
    v.paid
FROM
         violations v
    JOIN drivers  d ON v.driver_id = d.driver_id
    JOIN vehicles vh ON v.vehicle_id = vh.vehicle_id;  -- kimin cerime tipi nedir? hansidir


SELECT
    v.violation_id,
    v.violation_type,
    o.full_name AS officer,
    o.rank,
    v.location
FROM
         violations v
    JOIN officers o ON v.officer_id = o.officer_id; -- hansi polis yazibdi yeni rutbesi

SELECT
    p.payment_id,
    d.first_name
    || ' '
    || d.last_name AS driver,
    p.amount_paid,
    p.payment_method,
    p.payment_date
FROM
         payments p
    JOIN violations v ON p.violation_id = v.violation_id
    JOIN drivers    d ON v.driver_id = d.driver_id;  --odenilmis cerimeler


SELECT
    vh.plate_number,
    vh.brand,
    vi.inspection_date,
    vi.result,
    vi.next_due_date
FROM
         vehicle_inspections vi
    JOIN vehicles vh ON vi.vehicle_id = vh.vehicle_id;  --texniki baxis neticeleri


SELECT
    d.driver_id,
    d.first_name
    || ' '
    || d.last_name AS full_name,
    v.violation_type,
    v.fine_amount
FROM
    drivers    d
    LEFT JOIN violations v ON d.driver_id = v.driver_id; --cerimesi olmayan suruculer

SELECT
    v.violation_id,
    d.first_name
    || ' '
    || d.last_name AS driver,
    v.fine_amount,
    p.amount_paid,
    p.payment_method
FROM
         violations v
    JOIN payments p ON v.violation_id = p.violation_id
    JOIN drivers  d ON v.driver_id = d.driver_id;  --cerimesi odenilenler


INSERT INTO officers (
    badge_number,
    full_name,
    rank,
    station_name
) VALUES ( 'YPX011',
           'Eldar Nəsirov',
           'leytenant',
           'Qax' );

--cerime yazmayan polis
SELECT
    o.officer_id,
    o.full_name
FROM
    officers   o
    LEFT JOIN violations v ON o.officer_id = v.officer_id
WHERE
    v.violation_id IS NULL;

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Rövşən',
           'Babayev',
           'AZ9990001',
           DATE '1980-04-20',
           DATE '2022-04-01',
           DATE '2032-04-01' );

SELECT
    d.driver_id,
    d.first_name
    || ' '
    || d.last_name AS full_name
FROM
    drivers    d
    LEFT JOIN violations v ON d.driver_id = v.driver_id
WHERE
    v.violation_id IS NULL;

COMMIT;

INSERT INTO drivers (
    first_name,
    last_name,
    license_number,
    birth_date,
    license_issue_date,
    license_expiry_date
) VALUES ( 'Lalə',
           'Əliyeva',
           'AZ4455667',
           DATE '1989-12-12',
           DATE '2023-01-01',
           DATE '2033-01-01' );
-- Avtomobil: texniki baxışı yoxdur
INSERT INTO vehicles (
    plate_number,
    model,
    brand,
    year,
    color,
    owner_id
) VALUES ( '10-LA-999',
           'Rio',
           'Kia',
           2022,
           'ağ',
           (
               SELECT
                   driver_id
               FROM
                   drivers
               WHERE
                   license_number = 'AZ4455667'
           ) );

-- Pozuntu əlavə edirik: ödəniş edilməmiş
INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    violation_date,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( (
    SELECT
        driver_id
    FROM
        drivers
    WHERE
        license_number = 'AZ4455667'
),
           (
               SELECT
                   vehicle_id
               FROM
                   vehicles
               WHERE
                   plate_number = '10-LA-999'
           ),
           'Sürət həddi aşımı',
           DATE '2025-08-01',
           'Bakı',
           1,
           50,
           'N' );

SELECT
    v.violation_id,
    d.first_name
    || ' '
    || d.last_name AS driver,
    v.fine_amount,
    v.paid
FROM
         violations v
    JOIN drivers  d ON v.driver_id = d.driver_id
    LEFT JOIN payments p ON v.violation_id = p.violation_id
WHERE
    p.payment_id IS NULL;

SELECT
    vh.vehicle_id,
    vh.plate_number,
    d.first_name
    || ' '
    || d.last_name AS owner
FROM
         vehicles vh
    JOIN drivers             d ON vh.owner_id = d.driver_id
    LEFT JOIN vehicle_inspections vi ON vh.vehicle_id = vi.vehicle_id
WHERE
    vi.inspection_id IS NULL;

DELETE FROM drivers
WHERE
    driver_id = 9;

SELECT
    driver_id,
    driver_name,
    total_fines,
    RANK()
    OVER(
        ORDER BY
            total_fines DESC
    ) AS fine_rank
FROM
    (
        SELECT
            d.driver_id,
            d.first_name
            || ' '
            || d.last_name     AS driver_name,
            SUM(v.fine_amount) AS total_fines
        FROM
                 drivers d
            JOIN violations v ON d.driver_id = v.driver_id
        GROUP BY
            d.driver_id,
            d.first_name,
            d.last_name
    );

SELECT
    o.full_name AS officer_name,
    v.fine_amount,
    round(AVG(v.fine_amount)
          OVER(PARTITION BY o.officer_id),
          2)    AS avg_by_officer,
    CASE
        WHEN v.fine_amount > AVG(v.fine_amount)
                             OVER(PARTITION BY o.officer_id) THEN
            'Yuxarı'
        WHEN v.fine_amount < AVG(v.fine_amount)
                             OVER(PARTITION BY o.officer_id) THEN
            'Aşağı'
        ELSE
            'Bərabər'
    END         AS comparison
FROM
         violations v
    JOIN officers o ON v.officer_id = o.officer_id;

INSERT INTO violations (
    driver_id,
    vehicle_id,
    violation_type,
    violation_date,
    location,
    officer_id,
    fine_amount,
    paid
) VALUES ( 4,              -- driver_id
           7,              -- vehicle_id
           'Qırmızı işıqda keçmək',
           DATE '2024-07-15',
           'Bakı şəhəri, Nərimanov',
           3,              -- officer_id
           90,             -- fine_amount (officer-in ortasından böyük)
           'N' );

SELECT
    v.violation_id,
    v.officer_id,
    v.fine_amount
FROM
    violations v
WHERE
    v.fine_amount > (
        SELECT
            AVG(v2.fine_amount)
        FROM
            violations v2
        WHERE
            v2.officer_id = v.officer_id
    );
    
    
    commit;