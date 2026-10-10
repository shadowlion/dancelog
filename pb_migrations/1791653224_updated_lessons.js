/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_2920376115")

  // update field
  collection.fields.addAt(8, new Field({
    "hidden": true,
    "id": "autodate3934075232",
    "name": "entry_updated",
    "onCreate": true,
    "onUpdate": true,
    "presentable": false,
    "system": false,
    "type": "autodate"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_2920376115")

  // update field
  collection.fields.addAt(8, new Field({
    "hidden": true,
    "id": "autodate3934075232",
    "name": "entry_updated",
    "onCreate": false,
    "onUpdate": true,
    "presentable": false,
    "system": false,
    "type": "autodate"
  }))

  return app.save(collection)
})
