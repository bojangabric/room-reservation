# Room reservation

Web application made in Java for searching hotels and room booking.

## User roles

### Admin

- create, change and delete hotels
- create, change and delete rooms
- create, change and delete room types
- create, change and delete hotel managers
- change or delete client info

### Manager

- change hotels where he has permission
- create, change, delete rooms where he has permission
- create, change, delete room types where he has permission

### Client

- search hotels
- search rooms
- make reservations
- cancel reservation

## Tech/Frameworks used

- Java (JSP, Java servlets)
- HTML5, CSS3, JavaScript
- XAMPP (Apache, MySQL, Tomcat)

## How to use locally

Download [XAMPP Control Panel](https://www.apachefriends.org/index.html).

Run and start Apache and MySQL.

Create `hotels` database with phpmyadmin. Import `hotels.sql` into that database.

Clone this repo `git clone https://github.com/bojangabric/room-reservation` and open it in NetBeans.

Change [/src/java/com/bojan/database/ConnectionProvider.java](/src/java/com/bojan/database/ConnectionProvider.java) with your credentials.

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).
