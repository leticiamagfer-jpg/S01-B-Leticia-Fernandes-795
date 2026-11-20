
; ESTRUTURA COM defstruct
(defstruct garota-magica
  nome
  escuridao   ; de 0 (joia limpa) a 100
  bruxas)     ; quantas bruxas ela já derrotou


; RECURSÃO COM null, car E cdr (sem reduce nem mapcar)
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))


; reduce E mapcar
(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))


; IMUTABILIDADE: "ALTERAR" = CRIAR OUTRA
(defun purifica (g quantidade)
  (let ((nova-escuridao
          (if (>= quantidade (garota-magica-escuridao g))
              0
              (- (garota-magica-escuridao g) quantidade))))
    (make-garota-magica :nome (garota-magica-nome g)
                        :escuridao nova-escuridao
                        :bruxas (garota-magica-bruxas g))))


; FUNÇÃO PRINCIPAL
(defun main ()
  (let* ((mami (make-garota-magica :nome "Mami" :escuridao 20 :bruxas 30))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 65
                                     :bruxas 4))
         (kyoko (make-garota-magica :nome "Kyoko" :escuridao 40
                                    :bruxas 15))
         (grupo (list mami sayaka kyoko))
         ; cons cria um grupo NOVO com a Madoka na frente
         (madoka (make-garota-magica :nome "Madoka" :escuridao 10
                                     :bruxas 0))
         (grupo-novo (cons madoka grupo))
         ; purifica devolve uma garota nova; a Sayaka original não muda
         (sayaka-pura (purifica sayaka 30)))

    (format t "--- Grupo ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Nova garota faz o contrato (cons) ---~%")
    (format t "Escuridao do grupo original: ~a~%" (escuridao-total grupo))
    (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))

    (format t "--- Purificacao ---~%")
    (format t "Escuridao da ~a original: ~a~%"
            (garota-magica-nome sayaka)
            (garota-magica-escuridao sayaka))
    (format t "Escuridao da ~a purificada: ~a~%"
            (garota-magica-nome sayaka-pura)
            (garota-magica-escuridao sayaka-pura))))


(main)


; SAÍDA DO PROGRAMA
; --- Grupo ---
; Escuridao total: 125
; Total de bruxas derrotadas: 49
; --- Nova garota faz o contrato (cons) ---
; Escuridao do grupo original: 125
; Escuridao do grupo novo: 135
; --- Purificacao ---
; Escuridao da Sayaka original: 65
; Escuridao da Sayaka purificada: 35
