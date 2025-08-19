package database

import (
	"database/sql"
	"time"
)

type EventModel struct {
	DB *sql.DB
}

type Event struct {
	ID          int       `json:"id"`
	OwnerId     int       `json:"ownerId" binding:"required"`
	Name        string    `json:"name" binding:"required, min=3"`
	Description string    `json:"description" binding:"required, min=10"`
	Date        time.Time `json:"date" binding:"required, datetime=2006-01-02T15:04:05Z07:00"`
	Location    string    `json:"location" binding:"required, min=3"`
}
