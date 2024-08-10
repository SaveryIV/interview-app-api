# Interview API

## Introduction
Hey there! I'm thrilled to introduce you to this amazing API 😎. It's a fully functional resource that enables you to create a platform for uploading and rating user-generated content👽👀. It's interactive🎯, user-friendly🙌, and ensures data security🔑. Remember, it's just as important to keep your password safe. And let's not forget... It's really cool!🏄‍♂️🏄‍♂️

## Link to API Docs and Production 🔗🌎
  Deploy on production: [Direct Link](https://interview-app-api.onrender.com) <br>
  Link to Docs: [Postman Docs](https://documenter.getpostman.com/view/29041377/2sA3s3Gqy9)

## How to Set Up the Project Locally ❓❓

In case you want to take it by yourself and test it in your local environment, here are the steps you need to take:

1. **Clone the Repository**  
   Clone the repository using the following command: `git clone https://github.com/SaveryIV/interview-app-api.git`.

2. **Navigate to the Project Directory**  
   Change into the project directory with: `cd interview-app-api`.

3. **Install Dependencies**  
   Install the project's dependencies using Bundler: `bundle install`.

4. **Set Up the Database**  
   Create and migrate the database with the following commands:
   - `rails db:create`
   - `rails db:migrate`

   If there are any seed data files, you can load them with: `rails db:seed`.

5. **Start the Server**
   Run the Rails server to start the application:
   ```bash
   rails server
   ```
   By default, the server will be accessible at http://localhost:3000.

6. **Test the API**
   You can test the API endpoints using a tool like Postman or cURL. Make sure to verify the functionality of key endpoints such as user creation, content upload, and rating.

   ## Troubleshooting 🐞🐞🔫

    If you encounter any issues, check the following:

- **Dependencies**: Ensure all dependencies are installed correctly.
- **Environment Variables**: Verify that environment variables are set up properly.
- **Logs**: Look at the logs for any errors that might indicate what's wrong.
- **Configuration**: Make sure any additional configuration files (like database or service credentials) are set up correctly.
