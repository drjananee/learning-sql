CREATE TABLE consultants (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL
);

CREATE TABLE hospitals (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL
);

CREATE TABLE cons_hospitals (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    consultant_id INTEGER NOT NULL REFERENCES consultants(id),
    hospital_id INTEGER NOT NULL REFERENCES hospitals(id)
);


INSERT INTO consultants (name) VALUES  ('Jananee'), ('Tuxy') , ('Mario');
INSERT INTO hospitals (name) VALUES  ('BMCRI'), ('MMCRI') , ('SJMCH'), ('SDUMC');


INSERT INTO cons_hospitals (consultant_id, hospital_id)
VALUES (13,3), (13,2), (13,1), (14,2), (14,3), (15,4), (16,3), (16,4);

SELECT * 
FROM cons_hospitals;

-- Full Join Query
SELECT consultants.name as "doctor", hospitals.name as "hospital"
FROM cons_hospitals
JOIN hospitals ON cons_hospitals.hospital_id = hospitals.id
JOIN consultants ON cons_hospitals.consultant_id = consultants.id;

-- Find Hopitals where Jananee Works
SELECT hospitals.name as "hospital"
FROM cons_hospitals
JOIN hospitals ON cons_hospitals.hospital_id = hospitals.id
JOIN consultants ON cons_hospitals.consultant_id = consultants.id
WHERE consultants.name = 'Jananee';

-- Find Consultants at SJMCH
SELECT consultants.name as "doctor"
FROM cons_hospitals
JOIN hospitals ON cons_hospitals.hospital_id = hospitals.id
JOIN consultants ON cons_hospitals.consultant_id = consultants.id
WHERE hospitals.name = 'SJMCH';