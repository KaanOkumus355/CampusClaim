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
  matriculation_number varchar(30) unique,
  foreign key (user_id) references users(user_id)
);

-- staff (subtype of users)
create table staff (
  user_id int primary key,
  department varchar(50),
  position varchar(50),
  foreign key (user_id) references users(user_id)
);

-- porters (subtype of users)
create table porters (
  user_id int primary key,
  access_level varchar(30),
  foreign key (user_id) references users(user_id)
);

-- locations (supertype)
create table locations (
  location_id int auto_increment primary key,
  address varchar(100)
);

-- building (location subtype)
create table building_locations (
  location_id int primary key,
  building_name varchar(50),
  floors int,
  foreign key (location_id) references locations(location_id)
);

-- room (location subtype)
create table room_locations (
  location_id int primary key,
  room_number varchar(30),
  foreign key (location_id) references locations(location_id)
);

-- outdoor (location subtype)
create table outdoor_locations (
  location_id int primary key,
  landmark varchar(50),
  area_description varchar(100),
  foreign key (location_id) references locations(location_id)
);

-- items (supertype)
create table items (
  item_id int auto_increment primary key,
  description varchar(500),
  photo varchar(100)
);

-- electronics (item subtype)
create table electronic_items (
  item_id int primary key,
  brand varchar(50),
  model varchar(50),
  foreign key (item_id) references items(item_id)
);

-- clothing (item subtype)
create table clothing_items (
  item_id int primary key,
  brand varchar(50),
  size varchar(30),
  color varchar(30),
  foreign key (item_id) references items(item_id)
);

-- accessories (item subtype)
create table accessory_items (
  item_id int primary key,
  material varchar(30),
  type varchar(30),
  foreign key (item_id) references items(item_id)
);

-- lost item report
create table lost_item_reports (
  report_id int auto_increment primary key,
  student_user_id int,
  description varchar(500),
  lost_date date,
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
  foreign key (item_id) references items(item_id),
  foreign key (location_id) references locations(location_id),
  foreign key (matched_report_id) references lost_item_reports(report_id)
);