# Complaint SharePoint List Schema

This list is used as the backend database for the Customer Complaint Tracker Power Apps.

## List Name
ComplaintList

## Columns

| Column Name       | Data Type            | Description |
|------------------|---------------------|-------------|
| Title            | Single line text    | Complaint title |
| Description      | Multiple lines text | Detailed complaint description |
| Category         | Choice              | Type of complaint (e.g., Service, Cleanliness, Product) |
| Location         | Single line text    | Location where issue occurred |
| CustomerContact  | Single line text    | Customer phone or email |
| Status           | Choice              | New / In Progress / Resolved |
| Priority         | Choice              | Low / Medium / High |
| ReceivedBy       | Person              | Staff who received the complaint |
| AssignedTo       | Person              | Staff responsible for handling |
| DateReported     | Date & Time         | Date when complaint was submitted |
