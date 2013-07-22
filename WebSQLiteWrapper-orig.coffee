# To convert to Javascript:
# coffee -bp WebSQLiteWrapper-orig.coffee > WebSQLiteWrapper.js

do ->
  DBWrapper = (dbargs) ->
    @dbargs = dbargs
    @mydb = window.openDatabase dbargs.name, "1.0", dbargs.name, 3*1024*1024 # TBD optional creation cb
    return

  DBWrapper::databaseFeatures =
    isWebSQLiteDatabaseWrapper: true

  DBWrapper::transaction = (cb, errorCB, okCB) ->
    @mydb.transaction cb, errorCB, okCB

  DBWrapper::executeSql = (sql, args, okCB, errorCB) ->
    @mydb.transaction (tr) ->
      tr.executeSql sql, args, okCB, errorCB

  window.webSQLiteWrapper =
    sqliteFeatures:
      isWebSQLiteWrapper: true

    openDatabase: (dbargs) ->
      # TODO check dbargs for db name
      return new DBWrapper(dbargs)

