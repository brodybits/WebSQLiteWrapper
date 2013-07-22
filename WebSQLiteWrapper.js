(function() {
  var DBWrapper;
  DBWrapper = function(dbargs) {
    this.dbargs = dbargs;
    this.mydb = window.openDatabase(dbargs.name, "1.0", dbargs.name, 3 * 1024 * 1024);
  };
  DBWrapper.prototype.databaseFeatures = {
    isWebSQLiteDatabaseWrapper: true
  };
  DBWrapper.prototype.transaction = function(cb, errorCB, okCB) {
    return this.mydb.transaction(cb, errorCB, okCB);
  };
  DBWrapper.prototype.executeSql = function(sql, args, okCB, errorCB) {
    return this.mydb.transaction(function(tr) {
      return tr.executeSql(sql, args, okCB, errorCB);
    });
  };
  return window.webSQLiteWrapper = {
    sqliteFeatures: {
      isWebSQLiteWrapper: true
    },
    openDatabase: function(dbargs) {
      return new DBWrapper(dbargs);
    }
  };
})();
