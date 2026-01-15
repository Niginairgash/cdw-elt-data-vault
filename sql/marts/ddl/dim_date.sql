create table marts.dim_date(
  date_pk    int primary key,
  full_date  date not null,
  year       int not null,
  month      int not null,
  day        int not null,
  quater     int not null
  );
