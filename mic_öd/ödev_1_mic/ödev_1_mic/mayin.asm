 Matris oluþturulur ve mayýnlar rastgele yerleþtirilir
matris db 10,10 ; Matrisin boyutlarý
mayin_sayisi dw 10 ; Matriste bulunacak mayýn sayýsý

; Matrisin her hücresine bir rastgele sayý atanýr
dongu:
    mov ax,matris ; Matrisin adresini al
    add ax,cx ; Matrisin hücresine gidilir
    mov bx,10 ; Rastgele sayýnýn aralýðý
    call rastgele ; Rastgele sayý üret
    cmp ax,0 ; Eðer 0 ise
    je mayin_koy ; Mayýn koy
    inc cx ; Cx'i artýr
    cmp cx,100 ; Eðer matrisin son hücresine gelinmiþse
    jne dongu ; Döngüyü tekrarla

; Mayýn tahminlerini kontrol et
tahmin_kontrol:
    mov ax,tahmin_x ; Tahmin edilen x koordinatýný al
    add ax,matris ; Matrisin adresine ekle
    mov bx,tahmin_y ; Tahmin edilen y koordinatýný al
    add bx,matris ; Matrisin adresine ekle
    mov al,[bx] ; Hücrenin deðerini al
    cmp al,0 ; Eðer 0 ise
    je mayin_var ; Mayýn var
    jmp mayin_yok ; Mayýn yok

; Mayýn yoksa etrafýndaki mayýnsýz hücrelerin sayýsýný bul
mayin_yok:
    mov cx,0 ; Mayýnsýz hücre sayacýný sýfýrla
    mov ax,tahmin_x-1 ; Tahmin edilen hücrenin sol tarafýna gidilir
    add ax,matris ; Matrisin adresine ekle
    mov bx,[ax] ; Hücrenin deðerini al
    cmp bx,0 ; Eðer 0 ise
    je sayac_artir ; Sayacý artýr
    inc ax ; Ax'i artýr
    mov bx,[ax] ; Hücrenin deðerini al
    cmp bx,0 ; Eðer 0 ise