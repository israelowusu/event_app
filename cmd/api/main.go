package main

import (
	"database/sql"
	"log"

	"github.com/israelowusu/event_app.git/internal/database"
	"github.com/israelowusu/event_app.git/internal/env"
	_ "github.com/joho/godotenv/autoload"
	_ "github.com/mattn/go-sqlite3"
)

type application struct {
	port      int
	jwtSecret string
	models    database.Models
}

func main() {
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	models := database.NewModels(db)
	app := &application{
		port:      env.GetEnvInt("PORT", 8080),
		jwtSecret: env.GetEnvString("JWT_SECRET", "secret"),
		models:    models,
	}

	if err := app.serve(); err != nil {
		log.Fatal(err)
	}
}
