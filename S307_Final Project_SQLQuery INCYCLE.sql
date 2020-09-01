create table incycle_google_maps (
coordinate varchar(30),
address varchar(50),
constraint incycle_google_maps_pk primary key (coordinate)
);

CREATE TABLE incycle_user (
user_id varchar(9),
first_name varchar(30),
last_name varchar(30),
email varchar(64),
user_name varchar(50),
password varchar(50),
dob date,
join_date date default GETDATE(),
constraint incycle_user_pk PRIMARY KEY (user_id)
);

CREATE TABLE incycle_interest (
interest_id varchar(5),
interest varchar(25),
constraint incycle_interest_pk PRIMARY KEY (interest_id)
);

CREATE TABLE incycle_user_interest (
interest_id varchar(5),
user_id varchar(9),
CONSTRAINT incycle_interest_pk PRIMARY KEY (interest_id, user_id),
constraint incycle_interest_fk foreign key (user_id)
REFERENCES incycle_user (user_id)
);


CREATE TABLE incycle_ride (
ride_id varchar(8),
mileage decimal(6,2),
date date,
start_time time,
end_time time,
CONSTRAINT incycle_ride_pk PRIMARY KEY (
);

create table incycle_ride_details (
user_id varchar(9),
ride_id varchar(8),
Constraint incycle_ride_details_pk primary key (user_id, ride_id),
Constraint incycle_ride_details_fk1 foreign key (user_id)
references incycle_user (user_id),
constraint incycle_ride_details_fk2 foreign key (ride_id)
references incycle_ride (ride_id)
);

CREATE TABLE incycle_credit_card (
credit_card_id varchar(8),
credit_card_number varchar(12),
cvv varchar(3),
provider varchar(25),
cardholder_first_name varchar(30),
cardholder_last_name varchar(30),
expiration_date date,
user_id varchar(9),
CONSTRAINT incycle_credit_card_pk PRIMARY KEY (Credit_card_id),
CONSTRAINT incycle_credit_card_fk1 FOREIGN KEY (user_id)
REFERENCES incycle_user (user_id)
);


CREATE TABLE incycle_facebook_user (
fb_username varchar(50),
user_id varchar(9),
password varchar(16),
CONSTRAINT incycle_facebook_user_pk PRIMARY KEY (fb_username),
constraint incycle_facebook_user_fk foreign key (user_id)
REFERENCES incycle_user (user_id)
);

CREATE TABLE incycle_google_user (
google_username varchar(64),
user_id varchar(9),
password varchar(16),
CONSTRAINT incycle_google_user_pk PRIMARY KEY (google_username),
constraint incycle_facebook_user_fk foreign key (user_id)
REFERENCES incycle_user (user_id)
);

CREATE TABLE incycle_stop (
stop_id varchar(12),
stop_name varchar(25),
stop_coordinate varchar(50),
CONSTRAINT incycle_stop_pk PRIMARY KEY (stop_id)
);

CREATE TABLE incycle_route (
route_id varchar(12),
route_name varchar(25),
start_address varchar(50),
end_address varchar(50),
CONSTRAINT incycle_route_pk PRIMARY KEY (route_id)
);

CREATE TABLE incycle_stop_details (
stop_id varchar(12),
route_id varchar(12),
CONSTRAINT incycle_stop_details_pk PRIMARY KEY (stop_id, route_id),
CONSTRAINT incycle_stop_details_fk1 FOREIGN KEY (stop_id)
REFERENCES incycle_stop (stop_id),
CONSTRAINT incycle_stop_details_fk2 FOREIGN KEY (route_id)
REFERENCES incycle_route (route_id)
);

CREATE TABLE incycle_route_quality (
quality_id varchar(5),
quality_list varchar(25),
symbol varchar(12),
CONSTRAINT incycle_route_quality_pk PRIMARY KEY (quality_id)
);

CREATE TABLE incycle_route_details (
quality_id varchar(5),
route_id varchar(12),
CONSTRAINT incycle_route_details_pk PRIMARY KEY (quality_id, route_id),
CONSTRAINT incycle_route_details_fk1 FOREIGN KEY (quality_id)
REFERENCES incycle_route_quality (quality_id),
CONSTRAINT incycle_route_details_fk2 FOREIGN KEY (route_id)
REFERENCES incycle_route (route_id)
);

CREATE TABLE incycle_user_post (
post_id varchar(8),
user_id varchar(8),
content varchar(50),
CONSTRAINT incycle_user_post_pk PRIMARY KEY (post_id),
CONSTRAINT incycle_user_post_fk FOREIGN KEY (user_id)
REFERENCES incycle_user (user_id)
);

create table incycle_post_comment (
comment_id varchar(8),
comment_post_id varchar(8),
original_post_id Varchar(8),
comment varchar(1000),
constraint incycle_post_comment_pk primary key (comment_id),
constraint incycle_post_comment_fk1 foreign key (original_post_id)
references incycle_user_post (post_id),
constraint incycle_post_comment_fk2 foreign key (comment_post_id)
references incycle_user_post (post_id)
);

CREATE TABLE incycle_award (
award_id varchar(5),
award_level varchar(3),
CONSTRAINT incycle_award_pk PRIMARY KEY (award_id)
);

CREATE TABLE incycle_shared_award (
award_id varchar(5),
post_id varchar(12),
CONSTRAINT incycle_shared_award_pk PRIMARY KEY (award_id, post_id),
CONSTRAINT incycle_shared_award_fk1 FOREIGN KEY (award_id)
REFERENCES incycle_award (award_id),
CONSTRAINT incycle_shared_award_fk2 FOREIGN KEY (post_id)
REFERENCES incycle_user_post (post_id)
);

create table incycle_premium_sub_plan (
plan_id varchar(8),
premium_level varchar(25),
price decimal(2,2),
constraint incycle_premium_sub_plan_pk primary key (plan_id)
);

CREATE TABLE incycle_payment(
payment_id varchar(8),
credit_card_id varchar(8),
plan_id varchar(8),
date date,
time time,
subscription_end_date date,
payment_amount decimal (3,2)
CONSTRAINT incycle_payment_pk PRIMARY KEY (payment_id),
constraint incycle_payment_fk1 foreign key (credit_card_id)
references incycle_credit_card (credit_card_id),
constraint incycle_payment_fk2 foreign key (plan_id)
references incycle_premium_sub_plan (plan_id)
);

create table incycle_user_location (
date date,
user_coordinate varchar(30),
user_id varchar (8),
constraint incycle_user_location_pk primary key (user_coordinate)
);

create table incycle_award_post (
award_id varchar(8),
post_id varchar(8),
constraint incycle_award_post_pk primary key (award_id, post_id),
constraint incycle_award_post_fk1 foreign key (award_id)
references incycle_award (award_id),
constraint incycle_award_post_fk2 foreign key (post_id)
references incycle_user_post (post_id)
);



create table incycle_review (
review_id varchar (8),
user_id varchar (8),
rating int,
content varchar(150),
constraint incycle_review_pk primary key (review_id),
constraint incycle_review_fk foreign key (user_id)
references incycle_user (user_id)
)