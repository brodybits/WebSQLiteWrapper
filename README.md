# Web sqlite wrapper

Web SQL API similar to [pgsqlite / PG-SQLitePlugin-Android](https://github.com/pgsqlite/PG-SQLitePlugin-Android) & [pgsqlite / PG-SQLitePlugin-iOS](https://github.com/pgsqlite/PG-SQLitePlugin-iOS)

Unlicense (public domain)

This Web sqlite wrapper is made to demonstrate a very similar API for both Web sqlite applications and Cordova/PhoneGap sqlite applications.

## Usage

Include:

    <script src="WebSQLiteWrapper.js"></script>

Open a database:

    var db = webSQLiteWrapper.openDatabase({name: 'DB'});

Single SQL statement:

    db.executeSql("select upper('Test1')", [], function(tx, res) {
      alert("result: " + JSON.stringify(res.rows.item(0)));
    });

Transaction batching:

    db.transaction(function(tx) {
      tx.executeSql("select upper('Test1')", [], function(tx, res) {
        alert("result: " + JSON.stringify(res.rows.item(0)));
      });
    });

