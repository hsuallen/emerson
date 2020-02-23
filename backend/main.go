package main

import (
	"fmt"
    "log"
    "net/http"
    "os"
    "time"
)

func main() {
    handler := http.DefaultServeMux
    handler.HandleFunc("/", HelloServer)
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    s := &http.Server {
        Addr:           ":" + port,
        Handler:        logging(handler),
        ReadTimeout:    10 * time.Second,
        WriteTimeout:   10 * time.Second,
    }
    log.Fatal(s.ListenAndServe())
}

type statusWriter struct {
    http.ResponseWriter
    status int
}

func (sw *statusWriter) WriteHeader(status int) {
        sw.status = status
        sw.ResponseWriter.WriteHeader(status)
}

func logging(h http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        log.Printf("[%s] %s %s", r.RemoteAddr, r.Method, r.URL)
        sw := statusWriter{ResponseWriter: w, status: 200}
        h.ServeHTTP(&sw, r)
        log.Printf("[%s] -> %d", r.RemoteAddr, sw.status)
    })
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
