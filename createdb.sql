CREATE TABLE Students(
    "SID" NUMBER PRIMARY KEY,
    Name VARCHAR(30),
    Major VARCHAR(30)
);

CREATE TABLE Projects(
    PID NUMBER PRIMARY KEY,
    P_Name VARCHAR(30)
);

CREATE TABLE Courses(
    CID NUMBER PRIMARY KEY,
    C_Name VARCHAR(30)
);

CREATE TABLE Members(
    PID NUMBER NOT NULL,
    "SID" NUMBER NOT NULL,
    FOREIGN KEY (PID) REFERENCES Projects (PID),
    FOREIGN KEY (SID) REFERENCES Students (SID)
);

CREATE TABLE Enrollments(
    CID NUMBER NOT NULL,
    "SID" NUMBER NOT NULL,
    FOREIGN KEY (CID) REFERENCES Courses (CID),
    FOREIGN KEY (SID) REFERENCES Students (SID)
);
