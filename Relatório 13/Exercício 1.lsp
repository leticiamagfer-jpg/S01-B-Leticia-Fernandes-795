
; ESTRUTURA COM defstruct
; gera make-erva, erva-nome, erva-preco-por-grama, erva-toxicidade e copy-erva

(defstruct erva
  nome
  preco-por-grama
  toxicidade)


; CLASSIFICAÇÃO COM cond
; as cláusulas são testadas de cima para baixo; o t é o "senão"

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))


; PREÇO DA DOSE: preço por grama vezes a quantidade de gramas

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))


; DESCRIÇÃO COM format nil

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))


; AVISO 

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar a erva em si mesma antes."
      "Liberada para o paciente."))


; FUNÇÃO PRINCIPAL

(defun main ()
  (let* ((hortela (make-erva :nome "Hortela" :preco-por-grama 0.8
                             :toxicidade 1))
         (ginseng (make-erva :nome "Ginseng" :preco-por-grama 3.5
                             :toxicidade 5))
         (aconito (make-erva :nome "Aconito" :preco-por-grama 12.0
                             :toxicidade 9))
         (ervas (list hortela ginseng aconito)))

    (format t "--- Estoque da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "  ~a~%" (aviso e)))

    (format t "--- Dose ---~%")
    (format t "Dose de 10 g de ~a: R$~,2f~%"
            (erva-nome ginseng)
            (preco-da-dose ginseng 10))))


; chamada 
(main)


; SAÍDA 
; --- Estoque da Maomao ---
; Hortela - R$0.80 por grama - segura
;   Liberada para o paciente.
; Ginseng - R$3.50 por grama - use com cuidado
;   Liberada para o paciente.
; Aconito - R$12.00 por grama - veneno
;   Aviso: Maomao vai testar a erva em si mesma antes.
; --- Dose ---
; Dose de 10 g de Ginseng: R$35.00
