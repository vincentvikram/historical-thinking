/* Author: Vikram Vincent */


struct timeline {
    int timeline_id;
    date start_date;
    date end_date;
    int period;
};

struct event {
    int event_id;
    string description;
    date start_date;
    date end_date;
    string perspective;
    string place_id;
    string event_type;
};

struct event_connections {
    struct event event1;
    struct event event2;
    int order_id; /* priority of the event */
    int impact_factor;	
    string type;
    int line_type;
};

struct person {
    int person_id;
    str name;
    date dob; // date of birth
    date dod; // date of death
    string nationality;
};
					
struct group {
    int group_id;
    string group_name;
};
					
struct region {
    int region_id;
    string name
};

struct place {
    int place_id;
    string name;
    string type;
    float latitude;
    float longitude;
};

struct map {
    int map_id;
    float latitude;
    float longitude;
    int scale;
    int height;
    int width;
};

struct perspective {
    int event_id;
    string perspective;
    struct person person_id;
    struct group group_id;
};
			
struct event_people {
    int event_id;
    struct person person_id;
    string participation_type;
};

struct tags {
    int tag_id;
    string description;
    int user_id;
    int event_id;
};

struct multimedia {
    int multimedia_id;
    string type;
};

struct event_image{
    int event_id;
    int image_id;
};

struct image_person {
    int image_id;
    int person_id;
};

struct event_place {
    int event_id;
    int place_id;
};

struct event_person {
    int event_id;
    int person_id;
};

struct person_group {
    int person_id;
    int group_id;
};
