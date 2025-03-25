# Odoo Order Management App

## 📌 Overview
The **Odoo Order Management App** is a mobile application built with Flutter that allows Odoo users to access and manage their orders efficiently. The app provides a seamless onboarding experience, user authentication, and an intuitive sales order management system.

## 🚀 Features

### ✅ Onboarding & Authentication
- Two onboarding screens introduce the app's features.
- Login page where users enter their **username** and **password** to sign in.
- User validation ensures only registered customers can log in.

### 📋 Order Management
- Displays the **latest 10 orders** in a grid format.
- There are two types of orders:
  - **Quotation Orders**
  - **Sales Orders**
- Orders are sorted by **date and time**, with the latest appearing at the top.

### 🛠️ Order Actions
- **Manage Quotation Orders:**
  - Users can **delete** quotation orders using the delete icon in the last column.
  - Users can **confirm** quotation orders by navigating to the **Confirm Order** page.
  - After confirming a quotation order (**when tapping a quotation order row and navigating to the Confirm Order page**), its status changes to a **sales order**, and the app automatically navigates back to the sales order screen, refreshing the grid.
- **Sales Orders:**
  - **Sales orders cannot be deleted.**
  - When users tap on a **sales order row**, they are navigated to the **Create Invoice** screen.


### 🖥️ Navigation
- **Drawer Menu:** 
  - A **menu icon** (top-left) and a **customer icon** (top-right) open a drawer.
- **Order Details:**
  - Clicking a **quotation order** navigates to the **Confirm Order** screen.
  - Clicking a **sales order** navigates to the **Create Invoice** screen.
  - Confirming an order automatically returns to the sales order screen and refreshes the grid.

## 🛠️ Technologies Used
- **Flutter** (Dart)
- **Odoo ERP Integration**
- **REST API for order management**



## 📌 Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Dilanka76/odoo_order_management_application.git
