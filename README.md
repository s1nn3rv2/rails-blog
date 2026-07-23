# Blogapp

A simple blogging app in Ruby on Rails where users can create and manage their own blogs, write posts and
discover content from other people.

## Features

- User authentication via Devise
- Create and manage blogs with custom cover images
- Write rich-text posts using the Trix editor (via Action Text)
- Browse and search all public blogs
- User profiles
- View counters on blogs and posts

## Stack

- **Ruby on Rails 8.1**
- **PostgreSQL**
- **Hotwire** (Turbo + Stimulus)
- **Tailwind CSS**
- **Active Storage** for image uploads
- **Action Text** for rich-text post editing
- **Devise** for authentication
- **Kaminari** for pagination

## Getting started

### Requirements

- Ruby 3.4
- PostgreSQL

### Setup

```bash
bundle install
rails db:setup
rails server
```
