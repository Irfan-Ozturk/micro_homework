 Matris olu�turulur ve may�nlar rastgele yerle�tirilir
matris db 10,10 ; Matrisin boyutlar�
mayin_sayisi dw 10 ; Matriste bulunacak may�n say�s�

; Matrisin her h�cresine bir rastgele say� atan�r
dongu:
    mov ax,matris ; Matrisin adresini al
    add ax,cx ; Matrisin h�cresine gidilir
    mov bx,10 ; Rastgele say�n�n aral���
    call rastgele ; Rastgele say� �ret
    cmp ax,0 ; E�er 0 ise
    je mayin_koy ; May�n koy
    inc cx ; Cx'i art�r
    cmp cx,100 ; E�er matrisin son h�cresine gelinmi�se
    jne dongu ; D�ng�y� tekrarla

; May�n tahminlerini kontrol et
tahmin_kontrol:
    mov ax,tahmin_x ; Tahmin edilen x koordinat�n� al
    add ax,matris ; Matrisin adresine ekle
    mov bx,tahmin_y ; Tahmin edilen y koordinat�n� al
    add bx,matris ; Matrisin adresine ekle
    mov al,[bx] ; H�crenin de�erini al
    cmp al,0 ; E�er 0 ise
    je mayin_var ; May�n var
    jmp mayin_yok ; May�n yok

; May�n yoksa etraf�ndaki may�ns�z h�crelerin say�s�n� bul
mayin_yok:
    mov cx,0 ; May�ns�z h�cre sayac�n� s�f�rla
    mov ax,tahmin_x-1 ; Tahmin edilen h�crenin sol taraf�na gidilir
    add ax,matris ; Matrisin adresine ekle
    mov bx,[ax] ; H�crenin de�erini al
    cmp bx,0 ; E�er 0 ise
    je sayac_artir ; Sayac� art�r
    inc ax ; Ax'i art�r
    mov bx,[ax] ; H�crenin de�erini al
    cmp bx,0 ; E�er 0 ise