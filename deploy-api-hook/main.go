package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/deploy", deployHandler)
	log.Fatal(http.ListenAndServe(":3000", nil))
}

func deployHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
	}
	// cmd run deploy.sh
}
