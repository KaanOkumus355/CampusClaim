-- users (supertype)
create table users (
  user_id int auto_increment primary key,
  name varchar(100) not null,
  email varchar(100) unique,
  phone varchar(30)
);

-- students (subtype of users)
create table students (
  user_id int primary key,
  student_id int unique,
  year int,
  major varchar(50),
  foreign key (user_id) references users(user_id)
);

-- staff (subtype of users)
create table staff (
  user_id int primary key,
  staff_id varchar(30) unique,
  department varchar(50),
  job_role varchar(50),
  foreign key (user_id) references users(user_id)
);

-- porters (subtype of users)
create table porters (
  user_id int primary key,
  porter_id varchar(30) unique,
  access_level varchar(30),
  shift_times varchar(50),
  foreign key (user_id) references users(user_id)
);

-- locations (supertype)
create table location (
  location_id int auto_increment primary key,
  address varchar(100),
  coordinates varchar(50)
);

-- building (location subtype)
create table building_locations (
  location_id int primary key,
  building_name varchar(50),
  floors int,
  foreign key (location_id) references location(location_id)
);

-- room (location subtype)
create table room_locations (
  location_id int primary key,
  room_number varchar(30),
  foreign key (location_id) references location(location_id)
);

-- outdoor (location subtype)
create table outdoor_locations (
  location_id int primary key,
  landmark varchar(50),
  area_description varchar(100),
  foreign key (location_id) references location(location_id)
);

-- items (supertype)
create table item (
  item_id int auto_increment primary key,
  description varchar(500),
  photo varchar(100),
  status boolean
);

-- electronics (item subtype)
create table electronic_items (
  item_id int primary key,
  brand varchar(50),
  model varchar(50),
  serial_number varchar(50) unique,
  foreign key (item_id) references item(item_id)
);

-- clothing (item subtype)
create table clothing_items (
  item_id int primary key,
  fabric varchar(50),
  size varchar(30),
  color varchar(30),
  foreign key (item_id) references item(item_id)
);

-- accessories (item subtype)
create table accessory_items (
  item_id int primary key,
  material varchar(30),
  accessory_type varchar(30),
  foreign key (item_id) references item(item_id)
);

-- lost item report
create table lost_item_reports (
  report_id int auto_increment primary key,
  student_user_id int,
  description varchar(500),
  lost_date date,
  date_reported date,
  lost_location varchar(100),
  contact_preference varchar(30),
  foreign key (student_user_id) references students(user_id)
);

-- found item (uploaded by porter)
create table found_items (
  found_id int auto_increment primary key,
  porter_user_id int,
  item_id int,
  location_id int,
  date_found date,
  collection_info varchar(100),
  is_collected boolean,  
  finder_notes varchar(500),
  matched_report_id int,
  foreign key (porter_user_id) references porters(user_id),
  foreign key (item_id) references item(item_id),
  foreign key (location_id) references location(location_id),
  foreign key (matched_report_id) references lost_item_reports(report_id)
);