; ESTRUTURA COM defstruct
(defstruct dominio
  nome
  elemento       ; uma keyword: :pyro, :hydro, :cryo, :electro ou :anemo
  dificuldade    ; de 1 a 5
  mora)


; BÔNUS ELEMENTAL COM case
; o otherwise cobre todos os elementos que não apareceram antes
(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))


; RECOMPENSA: a mora do domínio vezes o bônus do elemento
(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))


; ROTA COM let*
; let* faz passos em sequência: o segundo usa o resultado do primeiro
;   1- remove-if-not mantém só os domínios com dificuldade <= máxima
;   2- mapcar transforma cada um em texto (format nil não imprime)
; devolve a lista de textos; a lista recebida não é alterada
(defun rota (lista dificuldade-maxima)
  (let* ((possiveis
           (remove-if-not
            (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
            lista))
         (textos
           (mapcar
            (lambda (d)
              (format nil "~a - ~,1f mora"
                      (dominio-nome d)
                      (recompensa-final d)))
            possiveis)))
    textos))


; FUNÇÃO PRINCIPAL
(defun main ()
  (let ((dominios
          (list
           (make-dominio :nome "Fragmentos Esquecidos" :elemento :pyro
                         :dificuldade 2 :mora 400)
           (make-dominio :nome "Ruinas Submersas" :elemento :hydro
                         :dificuldade 3 :mora 500)
           (make-dominio :nome "Cume do Trovao" :elemento :electro
                         :dificuldade 4 :mora 600)
           (make-dominio :nome "Vale Congelado" :elemento :cryo
                         :dificuldade 1 :mora 300)
           (make-dominio :nome "Templo dos Ventos" :elemento :anemo
                         :dificuldade 5 :mora 800))))

    (format t "--- Rota ate dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "--- Total de mora da lista inteira ---~%")
    (format t "~,1f mora~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    ; CONTRASTE: O LISP PERMITE ALTERAR
    ; o setf muda a moraa da CÓPIA no lugar, o original continua igual
    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 1000)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (car dominios))))))


(main)


; SAÍDA DO PROGRAMA
; --- Rota ate dificuldade 3 ---
; Fragmentos Esquecidos - 400.0 mora
; Ruinas Submersas - 600.0 mora
; Vale Congelado - 300.0 mora
; --- Total de mora da lista inteira ---
; 3000.0 mora
; --- O Lisp permite alterar (setf) ---
; Mora da copia: 1000
; Mora do original: 400
