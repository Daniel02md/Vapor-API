import Foundation

func main(clsr: () -> ()) -> String{
   clsr()
    return "main"
}


let closure = main{
    print("cls")
}
print(closure)


