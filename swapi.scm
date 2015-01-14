(require-extension http-client medea intarweb uri-common)

(client-software '(("scheme-swapi" #f #f)))

(define (planets)
    (with-input-from-request "http://swapi.co/api/planets/" #f read-json))

(define (tatooine)
    (with-input-from-request "http://swapi.co/api/planets/1" #f read-json))

(define (planet x)
  (let* ((planetx (number->string x))
         (planeturi (update-uri (uri-reference "http://swapi.co/")
                                 path: `(/ "api" "planets" ,planetx)))
         (req (make-request
               method: 'GET
               uri: planeturi)))
    (with-input-from-request req #f read-json)))