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
    event event1;	
    event event2;
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
