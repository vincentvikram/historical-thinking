import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "."

Rectangle {
    id: rect1
    width: 200
    height: 100

    Text {
        text: "?"
        anchors.horizontalCenter: parent.horizontalCenter

        function addEntries() {
            var db = LocalStorage.openDatabaseSync("HistoricalThinking", "1.0", "Database for Historical Thinking project", 1000000);
            console.log("Db connected to : ", db);

            db.transaction(
                function(tx) {
                    // Create the database if it doesn't already exist
                    tx.executeSql('CREATE TABLE IF NOT EXISTS Event(event_id INTEGER, description TEXT, startDate TEXT, endDate TEXT, perspective TEXT, placeId INTEGER, type TEXT)');
                    console.log("Table Event exists/created")
                    tx.executeSql('CREATE TABLE IF NOT EXISTS People(people_id INTEGER, name TEXT, dob TEXT, dod TEXT, nationality TEXT, participation_type TEXT)');
                    console.log("Table People exists/created")
                    tx.executeSql('CREATE TABLE IF NOT EXISTS EventConnections(connection_id INTEGER, event_id_1 INTEGER, event_id_2 INTEGER, impactFactor TEXT, type TEXT)');
                    console.log("Table EventConnections exists/created")


                    // Sample insert statement. Please insert only variables
                    tx.executeSql('INSERT INTO Event VALUES(?, ?, ?, ?, ?, ?, ?)', [ 102, "world creation", '12/12/09','12/13/10', 'my view', '1001', 'critical' ]);

                    // Show all added event entries
                    var rs = tx.executeSql('SELECT * FROM Event');

                    var r = ""
                    for(var i = 0; i < rs.rows.length; i++) {
                        r += rs.rows.item(i).description + ", " + rs.rows.item(i).type + rs.rows.item(i).startDate + rs.rows.item(i).endDate + "\n" + "Events stored and fetched!" + "\n"
                    }
                    text = r                    
                }
            )
        }

        Component.onCompleted: addEntries()
    }
}
