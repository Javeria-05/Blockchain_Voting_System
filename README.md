# 🗳️ Blockchain Based Voting System

A secure and transparent Blockchain-Based Voting System developed using Flutter, Firebase Authentication, and Cloud Firestore. The system allows voters to register, log in, cast a vote, and view election results, while administrators can manage candidates and monitor voting activity.

---

## 🚀 Features

### 👤 Voter Module

* User Registration using Firebase Authentication
* Secure Login System
* One User = One Vote Validation
* Dynamic Candidate Selection
* Live Election Results
* Logout Functionality

### 👨‍💼 Admin Module

* Secure Admin Login
* Add New Candidates
* Delete Candidates
* View Live Vote Counts
* Monitor Election Results
* Manage Election Data

### 🔥 Firebase Integration

* Firebase Authentication
* Cloud Firestore Database
* Real-Time Data Synchronization
* Secure User Management

---

## 🏗️ System Architecture

```text
User Registration
        │
        ▼
Firebase Authentication
        │
        ▼
User Login
        │
        ▼
Home Dashboard
   ┌───────────────┐
   │               │
   ▼               ▼
Vote Screen    Admin Panel
   │               │
   ▼               ▼
Firestore      Candidate Management
   │
   ▼
Live Results
```

---

## 📂 Database Structure

### Users Collection

```text
users
 └── uid
      ├── name
      ├── email
      ├── cnic
      ├── role
      └── createdAt
```

### Candidates Collection

```text
candidates
 └── documentId
      ├── name
      ├── votes
      └── createdAt
```

### Votes Collection

```text
votes
 └── userUID
      ├── candidate
      ├── candidateId
      ├── userId
      └── votedAt
```

---

## 🛠️ Technologies Used

* Flutter
* Dart
* Firebase Authentication
* Cloud Firestore
* Material Design
* Git & GitHub

---

## 🔒 Security Features

* Secure Firebase Authentication
* Role-Based Access Control
* Admin & Voter Separation
* One User One Vote Enforcement
* Firestore-Based Vote Validation

---

## 📸 Screens Included

* Login Screen
* Registration Screen
* Home Dashboard
* Admin Login
* Admin Dashboard
* Add Candidate Screen
* Vote Casting Screen
* Live Election Results Screen

---

## 🎯 Key Functionalities

### Voter Workflow

```text
Register
   ↓
Login
   ↓
Select Candidate
   ↓
Submit Vote
   ↓
View Results
```

### Admin Workflow

```text
Admin Login
      ↓
Dashboard
      ↓
Add Candidate
      ↓
Monitor Results
      ↓
Manage Election
```

---

## 🏆 Project Highlights

✔ Real-Time Election Monitoring

✔ Dynamic Candidate Management

✔ Firebase Authentication Integration

✔ Firestore Database Connectivity

✔ Secure Voting Mechanism

✔ One User = One Vote Rule

✔ Responsive Flutter UI

✔ Role-Based User Access

---

## 📌 Future Enhancements

* Blockchain Hash Storage
* Winner Announcement System
* Election Reset Functionality
* Candidate Images
* Voting Analytics Dashboard
* Multi-Election Support
* Email Verification

---

## 👩‍💻 Developer

**Javeria Irum**

BS Software Engineering

COMSATS University Islamabad, Attock Campus

---

## ⭐ Project Status

Completed Core Functionality Successfully ✅

Ready for Demonstration, Academic Submission, and Further Enhancements 🚀
