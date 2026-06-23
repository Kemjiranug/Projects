# Customer Complaint Tracker

A Power Apps canvas app integrated with SharePoint and Power Automate to streamline customer complaint management in retail environments.

## Features

* Log customer complaints through Power Apps
* Track complaints by status (New, In Progress, Resolved)
* Automatic email notifications with Power Automate
* Real-time dashboard with complaint statistics

## Tech Stack

* **Microsoft Power Apps (Canvas App)**
* **SharePoint List**
* **Power Automate**

## Workflow

```text
Customer Report
      ↓
Power Apps Form
      ↓
SharePoint List
      ↓
Power Automate Notification
      ↓
Status Update
      ↓
Resolution Email
```

## Application Preview

### Log Complaint Screen

<p align="center">
  <img src="./Screenshot%202026-06-23%20230553.png" width="700">
</p>

<p align="center">
Users can submit customer complaints by entering customer information, selecting a category, and describing the issue.
</p>

---

### Track Complaint Screen

<p align="center">
  <img src="./Screenshot%202026-06-23%20232058.png" width="700">
</p>

<p align="center">
Displays all complaints with status indicators, allowing users to monitor progress and search records efficiently.
</p>

---

### Complaint Detail Screen

<p align="center">
  <img src="./Screenshot%202026-06-24%20003850.png" width="700">
</p>

<p align="center">
Provides detailed information about each complaint, including customer data, category, and current status.
</p>

---

### Edit Complaint Screen

<p align="center">
  <img src="./Screenshot%202026-06-24%20004659.png" width="700">
</p>

<p align="center">
Authorized users can update complaint information and change the status as issues are being processed.
</p>

---

### Dashboard

<p align="center">
  <img src="./Screenshot%202026-06-24%20005936.png" width="700">
</p>

<p align="center">
Visual dashboard showing complaint statistics and status distribution in real time.
</p>

---

### Power Automate Flow

<p align="center">
  <img src="./Screenshot%202026-06-24%20005436.png" width="700">
</p>

<p align="center">
Automated workflow that processes complaints and updates their status.
</p>




##  Learnings

* Connecting Power Apps with SharePoint
* Using `Patch()` and `SubmitForm()`
* Creating Power Automate workflows
* Developing dashboards with real-time data
