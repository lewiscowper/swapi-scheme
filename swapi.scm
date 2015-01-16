(require-extension http-client medea intarweb uri-common)

(client-software '(("scheme-swapi" #f #f)))

;; Not sure why I can't add the /api

(define baseuri "http://swapi.co/")

;; going to use this when I get to validating that something that I'm making is a valid request

(define (endpoints)
  (let* ((swapiuri (update-uri (uri-reference baseuri)
                                path: `(/ "api")))
         (req (make-request
               method: 'GET
               uri: swapiuri)))
    (with-input-from-request req #f read-json)))

;; example usage: (getall "films")

(define (get-all endpoint)
  (let* ((resource (->string endpoint))
         (endpointuri (update-uri (uri-reference baseuri)
                                   path: `(/ "api" ,resource)))
         (req (make-request
               method: 'GET
               uri: endpointuri)))
    (with-input-from-request req #f read-json)))

;; example usage: (get "films" 1)

(define (get endpoint x)
  (let* ((resource (->string endpoint))
         (y (->string x))
         (swapiuri (update-uri (uri-reference baseuri)
                                path: `(/ "api" ,resource ,y)))
         (req (make-request
               method: 'GET
               uri: swapiuri)))
    (with-input-from-request req #f read-json)))

;; example usage: (get-schema "films")

(define (get-schema endpoint)
  (let* ((resource (->string endpoint))
         (swapiuri (update-uri (uri-reference baseuri)
                                path: `(/ "api" ,resource "schema")))
         (req (make-request
               method: 'GET
               uri: swapiuri)))
    (with-input-from-request req #f read-json)))
