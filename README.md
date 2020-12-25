# the boba app

A mobile application to track your boba consumption

v1.0 Features (Current WIP):
 * MVP
 * Maintain list of boba drinks consumed as entries in a list
 * Each list item contains details of drink's:
    * Name
    * Source
    * Price
    * Purchase Date
    * Volume

 * List is modifiable
    * Add, Delete, Modify list items


v2.0 Features
 * View consumption metrics
 * Graph of volumetric consumption
 * View amount spent
 * View Ranking of sources


v3.0 Features
 * User Account management
 * App themes (based on drink toppings heh)



 Some Notes:
  * Currently using SQLite as backend database as the app has no cross user functionalities
    * May switch to cloud storage if app becomes popular and requires greater user analytics and scaling
    * In this case there will be some migration feature so data will not be lost
