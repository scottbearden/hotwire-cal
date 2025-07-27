# Hotwire Calendar

A modern calendar application built with Ruby on Rails 8 and Hotwire, featuring real-time updates and a responsive interface.

## Features

- **User Authentication**: Secure user registration and login system
- **Calendar Management**: Create, edit, and delete multiple calendars with custom colors
- **Event Management**: Add, edit, and delete events with start/end times
- **User Settings**: Account management, password changes, and personal details
- **Responsive Design**: Built with Tailwind CSS for mobile and desktop
- **Real-time Updates**: Powered by Hotwire for seamless user experience

## Tech Stack

- **Ruby**: 3.4.5
- **Rails**: 8.0
- **Database**: MySQL
- **Frontend**: Hotwire (Turbo + Stimulus), Tailwind CSS
- **Authentication**: Custom authentication system
- **Background Jobs**: Solid Queue (Rails 8 default)
- **Cache**: Solid Cache
- **Cable**: Solid Cable for ActionCable

## Getting Started

### Prerequisites

- Ruby 3.4.5
- Rails 8.0
- MySQL 8.0+
- Node.js and Yarn (for asset compilation)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd hotwire-cal
   ```

2. Install dependencies:
   ```bash
   bundle install
   yarn install
   ```

3. Configure your database:
   ```bash
   # Update config/database.yml with your MySQL credentials
   ```

4. Setup the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. Start the development server:
   ```bash
   rails server
   ```

6. Visit `http://localhost:3000` in your browser

### Development Tools

- **Job Queue Monitoring**: Visit `/jobs` in development to monitor background jobs with Mission Control
- **Health Check**: Available at `/up` for monitoring

## Rails 8 Features

This application leverages several Rails 8 improvements:
- **Solid Queue**: For reliable background job processing
- **Solid Cache**: For improved caching performance
- **Solid Cable**: For WebSocket connections
- **Enhanced Hotwire**: Better integration and performance
- **Improved Authentication**: Modern authentication patterns

## Usage

1. **Sign Up**: Create a new account or log in with existing credentials
2. **Create Calendars**: Add new calendars with custom names and colors
3. **Manage Events**: Add events to your calendars with titles, dates, and times
4. **Settings**: Update your account details, password, and personal information

## Database Schema

### Main Models
- **User**: Manages user accounts and authentication
- **Calendar**: User-owned calendars with names and colors
- **Event**: Calendar events with summaries, start/end times

### Relationships
- User has many Calendars
- User has many Events (through Calendars)
- Calendar belongs to User and has many Events
- Event belongs to User and Calendar

## API Endpoints

### Authentication
- `GET /sessions/new` - Login page
- `POST /sessions` - Create session
- `DELETE /logout` - Destroy session
- `GET /registrations/new` - Sign up page
- `POST /registrations` - Create account

### Calendars
- `GET /calendars` - List user's calendars
- `GET /calendars/new` - New calendar form
- `POST /calendars` - Create calendar
- `GET /calendars/:id` - Show calendar
- `GET /calendars/:id/edit` - Edit calendar form
- `PATCH /calendars/:id` - Update calendar
- `DELETE /calendars/:id` - Delete calendar

### Events
- `GET /events` - List user's events
- `GET /events/new` - New event form
- `POST /events` - Create event
- `GET /events/:id` - Show event
- `GET /events/:id/edit` - Edit event form
- `PATCH /events/:id` - Update event
- `DELETE /events/:id` - Delete event

### Settings
- `GET /settings/account/edit` - Account settings
- `GET /settings/password/edit` - Password change
- `PATCH /settings/password` - Update password
- `GET /settings/personal_details/edit` - Personal details
- `PATCH /settings/personal_details` - Update personal details

## Configuration

### Database
The application uses MySQL. Configure your database settings in `config/database.yml`:

```yaml
development:
  adapter: mysql2
  encoding: utf8mb4
  database: hotwire_cal_development
  username: your_mysql_username
  password: your_mysql_password
  host: localhost
```

### Environment Variables
Set up the following environment variables for production:
- `DATABASE_URL` - MySQL connection string
- `SECRET_KEY_BASE` - Rails secret key
- `RAILS_MASTER_KEY` - For encrypted credentials

## Deployment

This Rails 8 application is ready for deployment on platforms like:
- **Heroku**: With MySQL add-on (ClearDB or JawsDB)
- **Railway**: Native MySQL support
- **DigitalOcean App Platform**: With managed MySQL
- **AWS**: Using RDS MySQL

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is available as open source under the terms of the [MIT License](LICENSE).

## Future Enhancements

- [ ] Calendar view with monthly/weekly/daily layouts
- [ ] Event recurring functionality
- [ ] Calendar sharing between users
- [ ] Email notifications for events
- [ ] Import/Export calendar data (iCal format)
- [ ] PWA capabilities for mobile app experience
- [ ] Event categories and tags
- [ ] Calendar integrations (Google Calendar, Outlook)
- [ ] Time zone support
- [ ] Event reminders and notifications