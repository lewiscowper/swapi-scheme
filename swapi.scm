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

;; this should all be inside a get all method

(define (planets)
    (with-input-from-request "http://swapi.co/api/planets/" #f read-json))

;; this should be in a get by id method

(define (planets x)
  (let* ((y (->string x))
         (swapiuri (update-uri (uri-reference baseuri)
                                 path: `(/ "api" "planets" ,y)))
         (req (make-request
               method: 'GET
               uri: swapiuri)))
    (with-input-from-request req #f read-json)))

;; this will hopefully become a generic *-schema method

(define (planets-schema)
  (let* ((swapiuri (update-uri (uri-reference baseuri)
                                 path: `(/ "api" "planets" "schema")))
         (req (make-request
               method: 'GET
               uri: swapiuri)))
    (with-input-from-request req #f read-json)))
