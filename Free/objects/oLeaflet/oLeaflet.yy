{
  "spriteId": {
    "name": "sLeafletIdle",
    "path": "sprites/sLeafletIdle/sLeafletIdle.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": {
    "name": "sLeafletIdle",
    "path": "sprites/sLeafletIdle/sLeafletIdle.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "pEnemy",
    "path": "objects/pEnemy/pEnemy.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"entityFragmentCount","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"random_range(15,25)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityFragment","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"oFragPlant","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityFragmentSpeed","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"random_range(3,4)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemyWanderDistance","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"400","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityDestroySound","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"mBushRustle","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityHitScript","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"LeafletHit","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityNPC","path":"objects/pEntity/pEntity.yy",},"objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"value":"0","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemyHP","path":"objects/pEnemy/pEnemy.yy",},"objectId":{"name":"pEnemy","path":"objects/pEnemy/pEnemy.yy",},"value":"3","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Enemies",
    "path": "folders/Objects/Entities/Enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "oLeaflet",
  "tags": [],
  "resourceType": "GMObject",
}