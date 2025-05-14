# AgriEnergy Connect Web Application

This is a prototype web application for the Agri-Energy Connect platform, designed to bridge the gap between the agricultural sector and green energy technology providers.

## Features

- **User Authentication**: Secure login system with role-based access
- **Farmer Dashboard**: View and manage products
- **Employee Dashboard**: Manage farmers and view all products with filtering capabilities
- **Responsive Design**: Works on desktop, tablet, and mobile devices

## Setup Instructions

### Prerequisites

- Visual Studio 2022
- .NET 6.0 SDK
- SQL Server (LocalDB included with Visual Studio)
- SQL Server Management Studio (SSMS) for database management

### Installation

1. Clone the repository or download the source code
2. Open the solution in Visual Studio 2022
3. Restore NuGet packages (right-click solution > Restore NuGet Packages)
4. Update the connection string in `appsettings.json` if needed
5. Run the following commands in Package Manager Console:
6. Build and run the application (F5)

### Default Users

**Farmer:**
- Username: farmer1
- Password: password123

**Employee:**
- Username: employee1
- Password: password123

## Functionality

### Farmer Role
- View personal product listings
- Add new products
- View farm details

### Employee Role
- View all farmers
- Add new farmers
- View and filter products by various criteria
- Search by name/description
- Filter by category
- Filter by date range

## Technical Stack

- Backend: ASP.NET Core MVC, C#
- Database: SQL Server with Entity Framework Core
- Frontend: HTML5, CSS3, Bootstrap 5, jQuery

## Project Structure

- `Controllers`: Handle HTTP requests and business logic
- `Models`: Data entities and view models
- `Views`: Razor views for UI
- `Data`: Database context and migrations
- `Services`: Business services (e.g., authentication)
- `wwwroot`: Static files (CSS, JS, images)

## License

This project is for demonstration purposes only.