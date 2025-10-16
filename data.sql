insert into users (name, email, phone) values
('Leonardo Dicaprio','ldicaprio@constructor.university','+4912312312312'),
('Emma Watson','ewatson@constructor.university','017688888888'),
('Peter Porter','pporter@constructor.university','+491441111111'),
('Nina Security','nsecurity@constructor.university','+491552222222');

insert into students (user_id, matriculation_number) values
(1, '10101010'),
(2, '01010101');

insert into porters (user_id, access_level) values
(3,'porter'),
(4,'security');

insert into locations (address) values
('College Ring 6'),
('College Ring 7'),
('Krupp College'),
('IRC'),
('Campus Green'),
('Basketball Court');

insert into building_locations (location_id, building_name, floors) values
(2,'Mercator College',3),
(1,'College III',2);

insert into room_locations (location_id, room_number) values
(3,'QSA'),
(4,'College Office');

insert into outdoor_locations (location_id, landmark, area_description) values
(5,'Campus Green','By the benches'),
(6,'Basketball Court','By the hoops');

insert into items (description, photo) values
('black backpack with blue stripes','/img/backpack1.jpg'),
('iphone with cracked screen','/img/iphone1.jpg'),
('blue jacket size m','/img/jacket1.jpg'),
('silver watch','/img/watch1.jpg'),
('black jacket size s','/img/jacket2.jpg'),
('gold bracelet','/img/bracelet1.jpg'),
('Samsung Galaxy Book 5 Pro 360','/img/laptop1.jpg');

insert into electronic_items (item_id, brand, model) values
(2,'Apple','iPhone 17'),
(7,'Samsung','Galaxy Book 5 Pro 360');

insert into clothing_items (item_id, brand, size, color) values
(3,'Nike','M','Blue'),
(5,'H&M','S','Black');

insert into accessory_items (item_id, material, type) values
(4,'Metal','Watch'),
(6,'Gold','Bracelet');

insert into lost_item_reports (student_user_id, description, lost_date, lost_location, contact_preference) values
(1,'lost blue jacket in krupp','2025-09-10','Krupp College','phone'),
(2,'lost phone in library','2025-01-02','IRC','email');

insert into found_items (porter_user_id, item_id, location_id, date_found, collection_info, is_collected, finder_notes, matched_report_id) values
(3, 3, 3, '2025-09-11','collect at krupp desk', true,'found on the sofa', 1),
(4, 2, 4, '2025-01-02','collect at irc security', false,'found in elevator', 2);
