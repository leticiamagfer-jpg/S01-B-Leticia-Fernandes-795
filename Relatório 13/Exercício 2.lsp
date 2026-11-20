
; ESTRUTURA COM defstruct
; o perigo é sempre uma keyword: :inofensiva, :agressiva ou :leviata
(defstruct criatura
  nome
  bioma
  profundidade
  perigo)


; CATÁLOGO GLOBAL COM defparameter
; nenhuma função muda este valor, então as funções que o leem são puras
(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Zona Rasa"
                  :profundidade 15 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Kelp"
                  :profundidade 50 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunas"
                  :profundidade 150 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Vale Perdido"
                  :profundidade 300 :perigo :leviata)))


; TEXTO DO PERIGO COM case
(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))


; DESCRIÇÃO COM format nil (devolve o texto, não imprime)
(defun descreve-criatura (c)
  (format nil "~a (~a) - ~a m - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))


; FILTRO COM remove-if-not E lambda
; a lambda usa o parâmetro metros, de fora dela
; devolve uma lista NOVA; o catálogo recebido não é alterado
(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))


; FUNÇÃO PRINCIPAL
(defun main ()
  (format t "--- Catalogo completo ---~%")
  (let ((textos (mapcar #'descreve-criatura *catalogo*)))
    (dolist (tx textos)
      (format t "~a~%" tx)))

  (format t "--- Abaixo de 100 m ---~%")
  (let* ((fundas (abaixo-de 100 *catalogo*))
         (textos (mapcar #'descreve-criatura fundas)))
    (dolist (tx textos)
      (format t "~a~%" tx))
    (format t "Total: ~a criaturas~%" (length fundas))))


(main)


; SAÍDA DO PROGRAMA
; --- Catalogo completo ---
; Peeper (Zona Rasa) - 15 m - Inofensiva
; Stalker (Floresta de Kelp) - 50 m - Agressiva
; Reaper Leviathan (Dunas) - 150 m - Leviata: mantenha distancia
; Ghost Leviathan (Vale Perdido) - 300 m - Leviata: mantenha distancia
; --- Abaixo de 100 m ---
; Reaper Leviathan (Dunas) - 150 m - Leviata: mantenha distancia
; Ghost Leviathan (Vale Perdido) - 300 m - Leviata: mantenha distancia
; Total: 2 criaturas
