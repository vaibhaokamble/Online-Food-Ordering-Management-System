# 🍔 Online Food Ordering Management System

<p align="center">

  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java"/>

  <img src="https://img.shields.io/badge/Spring%20Boot-2.7-6DB33F?style=for-the-badge&logo=springboot&logoColor=white" alt="Spring Boot"/>

  <img src="https://img.shields.io/badge/Spring%20Data%20JPA-6DB33F?style=for-the-badge&logo=spring&logoColor=white" alt="Spring Data JPA"/>

  <img src="https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>

  <img src="https://img.shields.io/badge/JSP-Servlet%20Web%20UI-007396?style=for-the-badge" alt="JSP"/>

</p>

<p align="center">

<strong>A full-stack web application for browsing food, managing carts, placing orders and administering an online food ordering platform.</strong>

</p>

<p align="center">

  <a href="https://github.com/vaibhaokamble/Online-Food-Ordering-Management-System">
    <img src="https://img.shields.io/badge/View%20Repository-GitHub-181717?style=for-the-badge&logo=github" alt="GitHub Repository"/>
  </a>

</p>

---

## 📌 Overview

The **Online Food Ordering Management System** is a Java-based full-stack web application developed using **Spring Boot, Spring Data JPA, JSP and MySQL**.

The application provides an online platform where users can browse food items, manage their shopping cart and place orders, while administrators can manage categories, food items and orders.

The project follows a traditional Spring MVC architecture with a server-side JSP presentation layer and a relational MySQL database.

---

## 🎯 Project Objectives

The primary goal of this project is to build a complete food-ordering workflow using Java and Spring Boot.

### Main objectives

* 🍔 Display available food items
* 🗂️ Organize food using categories
* 👤 Manage customer accounts
* 🛒 Add and remove food items from cart
* 📦 Place food orders
* 📋 Manage order information
* 👨‍💼 Provide administrative functionality
* 🗄️ Persist application data using MySQL
* 📧 Support email-based functionality
* 📄 Generate PDF documents where required

---

# ✨ Features

## 👤 Customer Features

* 🔐 User registration and login
* 👤 User account management
* 🍔 Browse food items
* 🗂️ Browse food by category
* 🔎 View food details
* 🛒 Add food to cart
* ➕ Update cart quantity
* ➖ Remove food from cart
* 💰 Calculate order totals
* 📦 Place orders
* 📋 View order information
* 📧 Email-related functionality

---

## 👨‍💼 Admin Features

* 🔐 Admin authentication
* 📊 Admin dashboard
* 🗂️ Category management
* 🍔 Food management
* 📦 Order management
* 👥 User management
* ➕ Add food
* ✏️ Update food
* 🗑️ Delete food
* ➕ Create categories
* ✏️ Update categories
* 🗑️ Delete categories
* 📋 View customer orders

---

# 🏗️ System Architecture

```text
                         ┌───────────────────────┐
                         │        USER           │
                         │   Browser / Client    │
                         └───────────┬───────────┘
                                     │
                                     │ HTTP Request
                                     ▼
                         ┌───────────────────────┐
                         │      SPRING MVC       │
                         │      Controllers      │
                         └───────────┬───────────┘
                                     │
              ┌──────────────────────┼──────────────────────┐
              │                      │                      │
              ▼                      ▼                      ▼
       ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
       │ User         │      │ Food         │      │ Category     │
       │ Controller   │      │ Controller   │      │ Controller   │
       └──────┬───────┘      └──────┬───────┘      └──────┬───────┘
              │                     │                     │
              └─────────────────────┼─────────────────────┘
                                    │
                  ┌─────────────────┼─────────────────┐
                  │                 │                 │
                  ▼                 ▼                 ▼
            ┌──────────┐      ┌──────────┐      ┌──────────┐
            │   DAO    │      │   JPA    │      │  Entity  │
            │  Layer   │      │ Hibernate│      │  Layer   │
            └────┬─────┘      └────┬─────┘      └────┬─────┘
                 │                 │                 │
                 └─────────────────┼─────────────────┘
                                   │
                                   ▼
                         ┌───────────────────────┐
                         │        MySQL          │
                         │       Database        │
                         └───────────────────────┘
```

---

# 🔄 Order Processing Flow

```text
┌──────────────┐
│    User      │
└──────┬───────┘
       │
       ▼
Browse Food
       │
       ▼
Select Food
       │
       ▼
Add To Cart
       │
       ▼
┌──────────────┐
│     Cart     │
└──────┬───────┘
       │
       ▼
Review Items
       │
       ▼
Calculate Total
       │
       ▼
Place Order
       │
       ▼
┌──────────────┐
│    Order     │
└──────┬───────┘
       │
       ▼
Persist Order
       │
       ▼
     MySQL
       │
       ▼
Order Confirmation
```

---

# 🧩 Application Modules

The application is organized around multiple business modules.

| Module       | Responsibility                                   |
| ------------ | ------------------------------------------------ |
| 👤 User      | Customer registration, login and user management |
| 👨‍💼 Admin  | Administrative operations                        |
| 🗂️ Category | Food category management                         |
| 🍔 Food      | Food item management                             |
| 🛒 Cart      | Shopping cart operations                         |
| 📦 Order     | Order creation and management                    |

The repository contains dedicated controllers for these areas, including `AdminController`, `CartController`, `CategoryController`, `FoodController`, `OrderController` and `UserController`.

---

# 🛠️ Technology Stack

## Backend

| Technology          | Purpose                 |
| ------------------- | ----------------------- |
| ☕ Java 17           | Application development |
| 🌱 Spring Boot 2.7  | Backend framework       |
| 🌐 Spring MVC       | Web request handling    |
| 🗄️ Spring Data JPA | Data persistence        |
| 🔗 Hibernate        | ORM                     |
| 📧 Spring Mail      | Email functionality     |
| 📄 FreeMarker       | Template processing     |
| 📑 OpenPDF          | PDF generation          |
| 🖥️ Tomcat          | Web container           |

The project's Maven configuration confirms Java 17, Spring Boot 2.7.0, Spring Data JPA, Spring Web, Tomcat, Spring Mail, FreeMarker and OpenPDF dependencies.

---

## Frontend

* JSP
* HTML5
* CSS3
* JavaScript
* JSTL
* Responsive web UI

---

## Database

* 🐬 MySQL
* Hibernate ORM
* Spring Data JPA

---

## Build & Development Tools

* Maven
* Git
* GitHub
* IntelliJ IDEA / Eclipse / STS
* Apache Tomcat
* MySQL Workbench

---

# 📂 Project Structure

```text
Online-Food-Ordering-Management-System/
│
├── .mvn/
│   └── wrapper/
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── com/
│       │       └── onlinefoodorder/
│       │           │
│       │           ├── OnlineFoodOrderApplication.java
│       │           ├── ServletInitializer.java
│       │           │
│       │           ├── controller/
│       │           │   ├── AdminController.java
│       │           │   ├── CartController.java
│       │           │   ├── CategoryController.java
│       │           │   ├── FoodController.java
│       │           │   ├── OrderController.java
│       │           │   └── UserController.java
│       │           │
│       │           ├── dao/
│       │           │   ├── AdminDao.java
│       │           │   ├── CartDao.java
│       │           │   ├── CategoryDao.java
│       │           │   ├── FoodDao.java
│       │           │   ├── OrderDao.java
│       │           │   └── UserDao.java
│       │           │
│       │           ├── entity/
│       │           │   ├── Admin.java
│       │           │   ├── Cart.java
│       │           │   ├── Category.java
│       │           │   ├── Food.java
│       │           │   ├── Orders.java
│       │           │   └── User.java
│       │           │
│       │           └── service/
│       │               └── ...
│       │
│       ├── resources/
│       │   ├── application.properties
│       │   ├── static/
│       │   └── templates/
│       │
│       └── webapp/
│           └── WEB-INF/
│               └── views/
│
├── bin/
│
├── pom.xml
├── mvnw
├── mvnw.cmd
└── README.md
```

> The repository also contains generated `bin/` content and SQL database scripts.

---

# 🗄️ Database Design

The project contains separate SQL structures for major business areas, including:

```text
online_food_order_admin
online_food_order_cart
online_food_order_category
online_food_order_food
online_food_order_orders
online_food_order_user
```

These database artifacts correspond to the application's core domains.

### Conceptual ERD

```text
                       ┌───────────────┐
                       │     USER      │
                       ├───────────────┤
                       │ id            │
                       │ name          │
                       │ email         │
                       │ password      │
                       └───────┬───────┘
                               │
                         1     │     N
                               ▼
                       ┌───────────────┐
                       │     CART      │
                       ├───────────────┤
                       │ id            │
                       │ user_id       │
                       │ food_id       │
                       │ quantity      │
                       └───────┬───────┘
                               │
                               │ N
                               ▼
                       ┌───────────────┐
                       │     FOOD      │
                       ├───────────────┤
                       │ id            │
                       │ name          │
                       │ price         │
                       │ category_id   │
                       └───────┬───────┘
                               │
                               │ N
                               ▼
                       ┌───────────────┐
                       │   CATEGORY    │
                       ├───────────────┤
                       │ id            │
                       │ name          │
                       └───────────────┘


                       ┌───────────────┐
                       │     ORDER     │
                       ├───────────────┤
                       │ id            │
                       │ user_id       │
                       │ total         │
                       │ status        │
                       └───────────────┘


                       ┌───────────────┐
                       │     ADMIN     │
                       ├───────────────┤
                       │ id            │
                       │ username      │
                       │ password      │
                       └───────────────┘
```

---

# 🔌 Request & Execution Flow

A typical request follows this path:

```text
Browser
   │
   │ HTTP Request
   ▼
Spring DispatcherServlet
   │
   ▼
Controller
   │
   ▼
DAO / Repository
   │
   ▼
Spring Data JPA
   │
   ▼
Hibernate
   │
   ▼
MySQL
   │
   ▼
Entity / Result
   │
   ▼
Controller
   │
   ▼
JSP View
   │
   ▼
HTML Response
   │
   ▼
Browser
```

---

# 🛒 Cart Workflow

```text
User
 │
 ▼
Browse Food
 │
 ▼
Select Food
 │
 ▼
Add to Cart
 │
 ▼
CartController
 │
 ▼
CartDao
 │
 ▼
MySQL
 │
 ▼
Cart Updated
 │
 ▼
Display Cart
```

The repository contains a dedicated `CartController` and `CartDao`, reflecting cart-specific business operations.

---

# 🍔 Food Management Workflow

```text
Admin
 │
 ▼
Admin Login
 │
 ▼
Food Management
 │
 ├── Add Food
 │
 ├── Update Food
 │
 ├── Delete Food
 │
 └── View Food
 │
 ▼
FoodController
 │
 ▼
FoodDao
 │
 ▼
MySQL
```

---

# 📦 Order Management Workflow

```text
Customer
   │
   ▼
Cart
   │
   ▼
Checkout
   │
   ▼
OrderController
   │
   ▼
OrderDao
   │
   ▼
MySQL
   │
   ▼
Order Created
   │
   ▼
Admin
   │
   ▼
Manage Order
```

---

# 📧 Email Integration

The project includes Spring Boot's mail dependency, allowing the application to integrate email-based functionality.

A typical flow is:

```text
Application
     │
     ▼
Email Service
     │
     ▼
SMTP Server
     │
     ▼
Customer Email
```

For production, SMTP credentials should always be provided through environment variables or a secure secret-management system.

---

# 📄 PDF Generation

The project includes **OpenPDF** for PDF generation.

Possible workflow:

```text
Order / Data
     │
     ▼
PDF Generator
     │
     ▼
OpenPDF
     │
     ▼
PDF Document
     │
     ▼
Download / Email
```

---

# ⚙️ Prerequisites

Before running the project, install:

* ☕ Java JDK 17
* 📦 Maven
* 🐬 MySQL Server
* 💻 IntelliJ IDEA / Eclipse / STS
* 🌐 Web Browser

Verify Java:

```bash
java -version
```

Verify Maven:

```bash
mvn -version
```

---

# 🚀 Getting Started

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/vaibhaokamble/Online-Food-Ordering-Management-System.git
```

## 2️⃣ Navigate to Project

```bash
cd Online-Food-Ordering-Management-System
```

## 3️⃣ Configure MySQL

Create the required database in MySQL.

```sql
CREATE DATABASE online_food_order;
```

Then configure your database connection in the application's configuration.

Example:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/online_food_order
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

> Use your actual database name and credentials according to the SQL/configuration included with the project.

---

# ▶️ Run the Application

Using Maven:

```bash
mvn spring-boot:run
```

Or using the Maven wrapper on Windows:

```bash
mvnw.cmd spring-boot:run
```

The application should normally be available at:

```text
http://localhost:8080
```

---

# 📦 Build the Application

```bash
mvn clean package
```

Because the project is configured with:

```xml
<packaging>war</packaging>
```

the application can also be packaged as a WAR for servlet-container deployment.

Generated artifact:

```text
target/
└── online-food-order-0.0.1-SNAPSHOT.war
```

---

# 🧪 Testing

The project includes Spring Boot's testing starter.

Recommended testing areas:

| Area         | Test               |
| ------------ | ------------------ |
| 👤 User      | Registration/Login |
| 🔐 Admin     | Authentication     |
| 🍔 Food      | CRUD operations    |
| 🗂️ Category | CRUD operations    |
| 🛒 Cart      | Add/Remove/Update  |
| 📦 Order     | Create/View/Update |
| 🗄️ Database | Persistence        |
| 📧 Email     | SMTP integration   |
| 📄 PDF       | PDF generation     |

---

# 🔐 Security Considerations

For a production deployment, the following improvements are recommended:

### Authentication

* 🔐 Hash passwords using BCrypt or Argon2
* 🔑 Implement Spring Security
* 🎟️ Use secure session management
* ⏱️ Configure session expiration

### Database

* 🛡️ Use parameterized queries
* 🚫 Prevent SQL injection
* 🔒 Never hard-code database credentials

### Application

* 🔐 Use HTTPS
* 🛡️ Add CSRF protection
* 🧹 Validate request data
* 🚫 Prevent unauthorized admin access
* 📝 Implement structured logging

### Secrets

Never commit:

```text
Database Password
SMTP Password
API Keys
Private Keys
JWT Secrets
Cloud Credentials
```

Use environment variables instead.

---

# ⚡ Performance Improvements

For production-scale deployment, consider:

* 📊 Database indexing
* ⚡ Query optimization
* 🧠 Hibernate caching
* 🗄️ Connection pooling
* 📦 Pagination for large datasets
* 🚀 Static asset caching
* 🔄 Async email processing
* 🧹 Proper transaction management
* 📈 Application monitoring

---

# 🧠 What I Learned From This Project

This project provides practical experience with:

### Java

* Object-Oriented Programming
* Exception Handling
* Collections
* Java Web Development

### Spring Boot

* Spring MVC
* Dependency Injection
* Spring Data JPA
* Hibernate
* REST-style controller design
* Maven dependency management

### Database

* MySQL
* Entity relationships
* CRUD operations
* ORM
* Database persistence

### Web Development

* JSP
* HTML
* CSS
* JavaScript
* Server-side rendering

### Application Architecture

```text
Presentation
     │
     ▼
Controller
     │
     ▼
DAO / Persistence
     │
     ▼
JPA / Hibernate
     │
     ▼
MySQL
```

---

# 🔮 Future Enhancements

The application can be evolved into a modern enterprise-grade food ordering platform.

## Backend

* 🚀 Upgrade to latest Spring Boot
* 🔐 Spring Security
* 🎟️ JWT authentication
* 👥 Role-Based Access Control
* 🌐 REST API architecture
* 🧩 Microservices
* ⚡ Redis caching
* 📬 Kafka / RabbitMQ
* 📊 Actuator + monitoring

## Frontend

* ⚛️ React.js
* 🎨 Tailwind CSS
* 📱 Mobile-first UI
* 📊 Admin dashboard
* 🔎 Advanced food search
* 🛒 Real-time cart updates

## DevOps

* 🐳 Docker
* ☁️ AWS
* 🔄 GitHub Actions
* 🚀 CI/CD
* 📈 Prometheus
* 📊 Grafana

---

# 🏆 Production Architecture — Future Version

```text
                         ┌─────────────────┐
                         │    React.js     │
                         │    Frontend     │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │   API Gateway   │
                         └────────┬────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
              ▼                   ▼                   ▼
       ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
       │ User Service│     │ Food Service│     │Order Service│
       └──────┬──────┘     └──────┬──────┘     └──────┬──────┘
              │                   │                   │
              └───────────────────┼───────────────────┘
                                  │
                   ┌──────────────┼──────────────┐
                   │              │              │
                   ▼              ▼              ▼
                MySQL           Redis          Kafka
                   │
                   ▼
              AWS / Docker
```

---

# 📸 Screenshots

Add application screenshots here to make the repository more attractive to recruiters.

Example:

```markdown
## 🏠 Home Page

![Home Page](screenshots/home.png)

## 🍔 Food Menu

![Food Menu](screenshots/food-menu.png)

## 🛒 Shopping Cart

![Shopping Cart](screenshots/cart.png)

## 📦 Orders

![Orders](screenshots/orders.png)

## 👨‍💼 Admin Dashboard

![Admin Dashboard](screenshots/admin-dashboard.png)
```

---

# 📊 Project Highlights

| Category         | Details                    |
| ---------------- | -------------------------- |
| 🏷️ Project Type | Full-Stack Web Application |
| ☕ Language       | Java 17                    |
| 🌱 Framework     | Spring Boot 2.7            |
| 🗄️ Database     | MySQL                      |
| 🧩 ORM           | Hibernate / JPA            |
| 🎨 UI            | JSP                        |
| 📦 Build Tool    | Maven                      |
| 🖥️ Packaging    | WAR                        |
| 📧 Email         | Spring Mail                |
| 📄 PDF           | OpenPDF                    |
| 🖥️ Server       | Tomcat                     |

---

# 👨‍💻 Developer

## Vaibhao Kamble

**Java Full Stack Developer**

Focused on building secure, scalable and maintainable applications using:

```text
Java
Spring Boot
Spring Security
REST APIs
Microservices
React.js
MySQL
PostgreSQL
Docker
AWS
Git & GitHub
```

---

# 🤝 Let's Connect

<p align="center">

<a href="https://github.com/vaibhaokamble">
<img src="https://img.shields.io/badge/GitHub-Vaibhao%20Kamble-181717?style=for-the-badge&logo=github&logoColor=white"/>
</a>

<a href="https://linkedin.com/in/vaibhaokamble">
<img src="https://img.shields.io/badge/LinkedIn-Vaibhao%20Kamble-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
</a>

</p>

---

# ⭐ Support

If you find this project useful, please consider giving the repository a ⭐.

It helps support the project and motivates continued development.

---

<p align="center">

### 🍔 Build • Order • Learn • Improve

**Built with ❤️ by Vaibhao Kamble**

</p>
