#Register a new user
curl -X POST http://localhost:8080/api/v1/auth/register \
-H "Content-Type: application/json" \
-d '{
    "email": "test@gmail.com",
    "password": "password123",
    "name": "Test user"
}' \
-w "\nHTTP Status: %{http_code}\n"

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHByIjoxNzU3MDkyOTk1LCJ1c2VySWQiOjF9.OzBhc-eXMAWpfViuETq3sc2pPKoadvGPKdv-XfwLWzw

# Login
curl -X POST http://localhost:8080/api/v1/auth/login \
-H "Content-Type: application/json" \
-d '{
    "email": "test@gmail.com",
    "password": "password123"
}' \
-w "\nHTTP Status: %{http_code}\n"

# Create a new event
curl -X POST http://localhost:8080/api/v1/events \
-H "Content-Type: application/json" \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHByIjoxNzU3MDkyOTk1LCJ1c2VySWQiOjF9.OzBhc-eXMAWpfViuETq3sc2pPKoadvGPKdv-XfwLWzw" \
-d '{
    "ownerId": 1,
    "name": "Board meeting",
    "description": "2025 dividend share update.",
    "location": "Zurich"
}' \
-w "\nHTTP Status: %{http_code}\n"

# Retrieve all events
curl -X GET http://localhost:8080/api/v1/events \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"

# Update events
curl -X PUT http://localhost:8080/api/v1/events/1 \
-H "Content-Type: application/json" \
-d '{
    "ownerId": 1,
    "name": "Shareholders meeting",
    "description": "2025 dividend share update.",
    "location": "Zurich"
}' \
-w "\nHTTP Status: %{http_code}\n"

# Delete an event
curl -X DELETE http://localhost:8080/api/v1/events/1 \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"

# Add attendee to event
curl -X POST http://localhost:8080/api/v1/events/7/attendees/1 \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"
