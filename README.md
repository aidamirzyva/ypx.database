# YPX Database 🚔

### Azərbaycan dilində
**YPX Database** – Yol Patrul Xidməti üçün hazırlanmış SQL məlumat bazası.  
Layihə sürücülər, avtomobillər, polis əməkdaşları, qayda pozuntuları, cərimələr, ödənişlər və texniki baxışların idarə olunmasını əhatə edir.  
Burada **CRUD əməliyyatları**, **JOIN sorğuları** və **analitik funksiyalardan** istifadə olunub.  

### English
**YPX Database** – An SQL database designed for Road Patrol Service management.  
The project covers drivers, vehicles, officers, traffic violations, fines, payments, and vehicle inspections.  
It includes **CRUD operations**, **JOIN queries**, and **analytic functions**.  

---

## 📂 Database Structure

### Tables
- **drivers** – sürücülər haqqında məlumat (adı, soyadı, lisenziya, doğum tarixi və s.)
- **vehicles** – avtomobillərin qeydiyyatı (nömrə nişanı, model, marka, il, rəng, sahibi)
- **officers** – YPX əməkdaşlarının məlumatları (badge number, ad-soyad, rütbə, məntəqə)
- **violations** – qayda pozuntuları (növü, tarixi, məkan, cərimə, ödəniş statusu)
- **payments** – ödənişlərin uçotu (tarix, məbləğ, ödəniş metodu)
- **vehicle_inspections** – texniki baxışlar (tarix, nəticə, növbəti baxış tarixi)

### Relations
- **drivers ↔ vehicles** → bir sürücünün bir neçə avtomobili ola bilər.
- **drivers ↔ violations** → qayda pozuntusu sürücü ilə əlaqələndirilir.
- **officers ↔ violations** → pozuntunu yazan YPX əməkdaşı.
- **violations ↔ payments** → cərimələrin ödənişi ilə əlaqə.
- **vehicles ↔ vehicle_inspections** → avtomobilin texniki baxışı.

---

## 🔧 Features
- Full **CRUD operations** (INSERT, UPDATE, DELETE, SELECT)
- **JOIN queries** for combining related data
- **Analytic functions** (RANK, AVG, etc.)
- Constraints (**PK, FK, CHECK, UNIQUE**) və **ON DELETE CASCADE**

---

## ▶️ Usage
1. SQL skripti Oracle Database və ya uyğun SQL mühitində çalışdır.
2. Tabellər avtomatik yaradılacaq.
3. `INSERT` nümunələri ilə test dataları əlavə olunub.
4. `SELECT` sorğuları ilə müxtəlif hesabatlar çıxarıla bilər.

---

## 📊 Example Queries
- Hansi sürücünün hansı avtomobili var?  
- Hansı sürücü hansı cəriməni alıb və ödəniş edibmi?  
- Hansı polis əməkdaşı daha çox cərimə yazıb?  
- Texniki baxışdan keçməyən avtomobillərin siyahısı.  

---

## 📜 License
This project is created for **educational purposes**.
