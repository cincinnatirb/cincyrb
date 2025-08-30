# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Cincinnati Ruby Brigade website - a Rails 7.2 application that manages events, speakers, and videos for the Cincinnati Ruby user group. The site includes both public pages and an admin interface for managing content.

## Development Commands

### Setup
```bash
./bin/setup
```
This script handles all initial setup: installs dependencies, prepares the database, and clears logs.

### Running the Application
```bash
bundle exec rails server
# or
bin/rails server
```

### Testing
```bash
bundle exec rspec
# Run specific test file
bundle exec rspec spec/models/past_event_spec.rb
# Run with failure details
bundle exec rspec -fp
```

### Code Quality
```bash
bundle exec rubocop
bundle exec rubocop -a  # auto-fix issues
bundle exec brakeman    # security analysis
bundle exec bundle-audit check  # check for security vulnerabilities
```

### Security Vulnerability Management
When `bundle-audit` reports security issues:
```bash
# Check for vulnerabilities
bundle exec bundle-audit check --update

# Fix vulnerabilities using conservative updates (preferred approach)
rm Gemfile.lock
bundle update [vulnerable_gem_names] --conservative

# Verify fixes
bundle exec bundle-audit check
bundle exec rspec  # ensure functionality isn't broken
```

**Important**: Avoid pinning specific patch versions in Gemfile. Use conservative updates to let Bundler resolve minimum required secure versions while maintaining semantic versioning constraints.

### Bundler Configuration
This project is configured to prevent bin directory pollution:
```bash
# View current bundler configuration
bundle config list

# The project has bin="" configured to prevent automatic binstub creation
# This keeps the bin directory clean during bundle operations
```

### Database Operations
```bash
bin/rails db:migrate
bin/rails db:rollback
bin/rails db:seed
bin/rails db:prepare    # setup for development
```

## Architecture

### Core Models
- **PastEvent**: Central model representing Ruby Brigade meetings with date, topic, and associated speakers/videos
- **Speaker**: Individual presenters with name and bio information
- **Video**: Recordings associated with past events
- **SpeakerAssignment**: Join model connecting speakers to events
- **AdminUser**: Authenticated users who can manage content via admin interface

### Controllers Structure
- **Public Interface**: `PagesController`, `PastEventsController`, `MeetingsController`, `ContactController`
- **Admin Interface**: Namespaced under `/admin` with full CRUD for past events, speakers, and videos
- **Authentication**: Uses Devise for admin user management

### Key Features
- Admin authentication via Devise at `/admin/login`
- RESTful admin interface for content management
- Public API for displaying events and speakers
- Contact form functionality
- "This Month in Ruby" feature page

### Directory Structure
- `app/models/`: ActiveRecord models with associations and validations
- `app/controllers/admin/`: Admin-only controllers for content management
- `app/views/admin/`: Admin interface templates
- `app/components/`: ViewComponent-based reusable UI components
- `app/services/`: Business logic services
- `spec/`: RSpec tests organized by type (models, requests, system, routing)

### Testing Strategy
- Model specs focus on validations, associations, and business logic
- Request specs test controller behavior and API responses
- System specs test full user workflows using Capybara
- Routing specs verify URL patterns and parameter handling

### Code Quality Tools
- RuboCop configured with Rails, RSpec, and Performance cops
- Brakeman for security analysis
- SimpleCov for test coverage
- Factory Bot for test data generation

### Authentication & Authorization
- Admin users authenticate via Devise
- Admin routes protected by authentication
- Public routes open to all visitors

## Common Development Patterns

When adding new features:
1. Create migrations for any database changes
2. Add model validations and associations
3. Create controller actions following RESTful conventions
4. Add corresponding views using existing component patterns
5. Write comprehensive specs covering happy path and edge cases
6. Run RuboCop and fix any style violations
7. **CRITICAL**: Always run `bin/ci` before committing to ensure all checks pass

**NEVER COMMIT CODE WHILE THE LOCAL BUILD IS NOT PASSING**
- Always run `bin/ci` before any commit
- This script runs: tests, linting, gem audit, and vulnerability scanning
- All checks must pass before committing changes
- If `bin/ci` fails, fix all issues before committing

The codebase follows standard Rails conventions with a focus on clean, maintainable code and comprehensive test coverage.

## Deployment

### Production Environment
- **Hosting**: [Fly.io](https://fly.io/) at [cincyrb.com](https://cincyrb.com/)
- **Deployment**: Automated on commits to `main` branch
- **Node.js**: Version 18.20.8 (defined in Dockerfile)
- **Asset Pipeline**: Assets precompiled during Docker build
- **Database**: PostgreSQL

### Staging Environment  
- **Hosting**: [Heroku](https://heroku.com/) at [staging.cincyrb.com](https://staging.cincyrb.com/)
- **Deployment**: Manual via Heroku dashboard

### Key Files
- `Dockerfile`: Multi-stage build with Node.js and asset precompilation
- `fly.toml`: Fly.io deployment configuration
- `node_modules/`: Excluded from git (installed during deployment)