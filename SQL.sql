CREATE TABLE 게임(
    게임ID INTEGER NOT NULL,
    게임이름 VARCHAR(255) NOT NULL,
    개발사 VARCHAR(255) NOT NULL,
    출시일 DATE NOT NULL,
    플랫폼 VARCHAR(255) NOT NULL,
    장르 VARCHAR(255) NOT NULL,
    PRIMARY KEY(게임ID)
);
CREATE TABLE 플레이어(
    플레이어ID INTEGER NOT NULL,
    닉네임 VARCHAR(255) NOT NULL,
    이메일 VARCHAR(255) NOT NULL,
    가입일자 DATE NOT NULL,
    플레이어경험치 INTEGER NOT NULL,
    플레이어레벨 INTEGER NOT NULL,
    PRIMARY KEY(플레이어ID)
);
CREATE TABLE 플레이(
    게임ID INTEGER NOT NULL,
    플레이어ID INTEGER NOT NULL,
    레벨업 BOOLEAN,
    채팅 TEXT,
    게임내결제 DECIMAL(10, 2),
    PRIMARY KEY(게임ID, 플레이어ID),
    FOREIGN KEY(게임ID) REFERENCES 게임(게임ID),
    FOREIGN KEY(플레이어ID) REFERENCES 플레이어(플레이어ID)
);
CREATE TABLE 서버(
    서버ID INTEGER NOT NULL,
    서버이름 VARCHAR(255) NOT NULL,
    서버IP주소 VARCHAR(255) NOT NULL,
    PRIMARY KEY(서버ID)
);
CREATE TABLE 저장(
    서버ID INTEGER NOT NULL,
    게임ID INTEGER NOT NULL,
    저장경로 TEXT NOT NULL,
    PRIMARY KEY(서버ID, 게임ID),
    FOREIGN KEY(서버ID) REFERENCES 서버(서버ID),
    FOREIGN KEY(게임ID) REFERENCES 게임(게임ID)
);
CREATE TABLE 관리자(
    관리자ID INTEGER NOT NULL,
    관리자이름 VARCHAR(255) NOT NULL,
    이메일 VARCHAR(255) NOT NULL,
    전화번호 VARCHAR(255) NOT NULL,
    PRIMARY KEY(관리자ID)
);
CREATE TABLE 관리(
    서버ID INTEGER NOT NULL,
    관리자ID INTEGER NOT NULL,
    로드밸런서 VARCHAR(255),
    PRIMARY KEY(서버ID, 관리자ID),
    FOREIGN KEY(서버ID) REFERENCES 서버(서버ID),
    FOREIGN KEY(관리자ID) REFERENCES 관리자(관리자ID)
);
CREATE TABLE 서버관리회사(
    회사ID INTEGER NOT NULL,
    회사이름 VARCHAR(255) NOT NULL,
    회사형태 VARCHAR(255) NOT NULL,
    PRIMARY KEY(회사ID)
);
CREATE TABLE 소속(
    관리자ID INTEGER NOT NULL,
    회사ID INTEGER NOT NULL,
    PRIMARY KEY(관리자ID, 회사ID),
    FOREIGN KEY(관리자ID) REFERENCES 관리자(관리자ID),
    FOREIGN KEY(회사ID) REFERENCES 서버관리회사(회사ID)
);

insert into 게임 (게임ID, 게임이름, 개발사, 출시일, 플랫폼, 장르)
values (1, 'A', '순천대', '2024-06-22', '스팀', 'RPG');

insert into 플레이어 (플레이어ID, 닉네임, 이메일, 가입일자, 플레이어경험치, 플레이어레벨)
values (2, 'suncheon', '@s.scnu.ac.kr', '2024-06-22', 100, 12);

insert into 플레이 (게임ID, 플레이어ID, 레벨업, 채팅, 게임내결제)
values (1, 2, TRUE, '안녕하세요', 29900);

insert into 서버 (서버ID, 서버이름, 서버IP주소)
values (3, '순천서버', '순천IP');

insert into 관리자 (관리자ID, 관리자이름, 이메일, 전화번호)
values (4, '홍길동', '@naver.com', '010-1234-5678');

insert into 저장 (서버ID, 게임ID, 저장경로)
values (3, 1, '순천서버');

insert into 관리 (서버ID, 관리자ID, 로드밸런서)
values (3, 4, '사용중');

insert into 서버관리회사 (회사ID, 회사이름, 회사형태)
values (5, '순천서버관리', '주식회사');

insert into 소속 (관리자ID, 회사ID)
values (4, 5);

select * from 게임;

select * from 플레이어;

select * from 플레이;

select * from 서버;

select * from 관리자;

select * from 관리;

select * from 저장;

select * from 서버관리회사;

select * from 소속;