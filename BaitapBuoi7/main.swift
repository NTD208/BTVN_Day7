//
//  main.swift
//  BaitapBuoi7
//
//  Created by Chu Du on 31/05/2021.
//

import Foundation

// MARK: - Bài 1:
/*
 Tạo đối tượng có tên SoHoc gồm có các thuộc tính và phương thức sau:

 + Thuộc tính: number1, number2

 + Phương thức:

 - Các hàm tạo không đối số, đầy đủ đối số

 - printInfo(): dùng để hiển thị number1, number2

 - addition(): dùng để cộng number1, number2

 - subtract(): trừ number1 cho number2

 - multi(): dùng để nhân number1, number2

 - division(): dùng để chia number1 cho number2.
 */

struct SoHoc {
    var number1:Float
    var number2:Float
    
    
    init() {
        self.number1 = 0
        self.number2 = 0
    }
    
    init(_ number1:Float, _ number2:Float) {
        self.number1 = number1
        self.number2 = number2
    }
    
    func printInfo() {
        print("""
            Number 1 = \(number1)
            Number 2 = \(number2)
            """)
    }
    
    func addition() {
        print("\(number1) + \(number2) = \(number1 + number2)")
    }
    
    func subtract() {
        print("\(number1) - \(number2) = \(number1 - number2)")
    }
    
    func multi() {
        print("\(number1) * \(number2) = \(number1 * number2)")
    }
    
    func division() {
        if number2 == 0 {
            print("\(number1) khong chia duoc cho \(number2)")
        } else {
            print("\(number1) / \(number2) = \(number1 / number2)")
        }
    }
}

print("------------------")

let sohoc1 = SoHoc()
sohoc1.printInfo()
sohoc1.addition()
sohoc1.subtract()
sohoc1.multi()
sohoc1.division()

print("------------------")

let sohoc2 = SoHoc(29, 7)
sohoc2.printInfo()
sohoc2.addition()
sohoc2.subtract()
sohoc2.multi()
sohoc2.division()

// MARK: - Bài 2:
/*
 Viết class NhanVien gồm các thuộc tính:

 + Tên

 + Tuổi

 + Địa chỉ

 + Tiền lương (kiểu Double)

 + Tổng số giờ làm (kiểu Int)

 Constructor không tham số. Constructor đầy đủ tham số.

 Và các phương thức:

 - printInfo() : in ra tất cả các thông tin của nhân viên

 - tinhThuong(): Tính toán và trả về số tiền thưởng của nhân viên theo công thức sau:

 Nếu tổng số giờ làm của nhân viên >=200 thì thưởng = lương * 20%

 Nếu tổng số giờ làm của nhân viên <200 và >=100 thì thưởng = lương * 10%

 Nếu tổng số giờ làm của nhân viên <100 thì thưởng = 0
 */

class NhanVien {
    var name:String
    var age:Int
    var address:String
    var salary:Double
    var totalHour:Int
    
    init() {
        self.name = ""
        self.age = 0
        self.address = ""
        self.salary = 0
        self.totalHour = 0
    }
    
    init(_ name:String, _ age:Int, _ address:String, _ salary:Double, _ totalHour:Int) {
        self.name = name
        self.age = age
        self.address = address
        self.salary = salary
        self.totalHour = totalHour
    }
    
    func printInfo() {
        print("""
            Ten: \(name)
            Tuoi: \(age)
            Dia chi: \(address)
            Luong: \(salary)đ
            Tong so gio lam: \(totalHour)
            """)
    }
    
    func getBonus() -> Double {
        var bonus:Double
        
        if totalHour < 100 {
             bonus = 0
        } else if totalHour < 200 {
            bonus = salary * 0.1
        } else {
            bonus = salary * 0.2
        }
        return bonus
    }
}

print("------------------")

let nv1 = NhanVien()
nv1.printInfo()
print("Tien thuong: \(nv1.getBonus())")

print("------------------")

let nv2 = NhanVien("Du", 21, "Ha Noi", 7000000, 200)
nv2.printInfo()
print("Tien thuong: \(nv2.getBonus())đ")

// MARK: - Bài 3:
/*
 Xây dựng tam giác (Triangle) có các thuộc tính và method như sau:

 Thuộc tính: 3 cạnh  của một tam giác

 Phương thức:

 - Hàm khởi tạo truyền vào 3 cạnh

 - Xác định kiểu tam giác: tam giác cân, tam giác đều, tam giác vuông, tam giác thường

 - Tính chu vi tam giác

 - Tính diện tích tam giác
 */

class Triangle {
    var a, b, c:Float
    
    init(_ a:Float, _ b:Float, _ c:Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    func isTriangle(a:Float, b:Float, c:Float) -> Bool{
        if a <= 0 || b <= 0 || c <= 0 {
            return false
        }
        if (a + b > c) && (a + c > b) && (c + b > a) {
            return true
        }
        return false
    }
    
    func kindOfTriangle() {
        if isTriangle(a: a, b: b, c: c) {
            if a == b && a == c {
                print("Tam giac deu")
            } else if (a == b && a != c) || (a == c && a != b) || (b == c && b != a) {
                print("Tam giac can")
            } else if (a*a + b*b == c*c) || (a*a + c*c == b*b) || (b*b + c*c == a*a) {
                print("Tam giac vuong")
            } else {
                print("Tam giac thuong")
            }
        } else {
            print("Khong phai tam giac")
        }
    }
    
    func getPerimeter() {
        if isTriangle(a: a, b: b, c: c) {
            let P = a + b + c
            print("Chu vi tam giac la: \(P)")
        }
    }
    
    func getArea() {
        if isTriangle(a: a, b: b, c: c) {
            let p = (a + b + c) / 2
            let S = sqrtf(p * (p - a) * (p - b) * (p - c))
            print("Dien tich tam giac la: \(S)")
        }
    }
}

print("------------------")

let tamgiac1 = Triangle(3, 4, 8)
tamgiac1.kindOfTriangle()
tamgiac1.getPerimeter()
tamgiac1.getArea()

print("------------------")

let tamgiac2 = Triangle(3, 4, 6)
tamgiac2.kindOfTriangle()
tamgiac2.getPerimeter()
tamgiac2.getArea()
