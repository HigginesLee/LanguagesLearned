public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        // 变量
        int id = 1;
        System.out.println(id);
        id = 2;
        System.out.println(id);
        String name = "村雨遥";
        System.out.println(name);

        int[] numbers = { 1, 2, 3, 4, 5 };
        for (int number : numbers) {
            System.out.println(number);
        }

        System.out.println(numbers.length);

    }
}

// public class Pet {
//     public String name;
//     public String furColor;
//     public int age;

//     public void eat() {
//         System.out.println("吃饭");
//     }
//     public void bark() {
//         System.out.println("叫");
//     }


//     public static void createPet(String[] args){
//         Pet dog = new Pet();
//         dog.name = "小白";
//         dog.furColor = "白色";
//         dog.age = 3;

//         Pet cat = new Pet();
//         cat.name = "小花";
//         cat.furColor = "花色";
//         cat.age = 2;
//     }

//     // 构造方法
//     public Pet(String name, String furColor, int age){
//         this.name = name;
//         this.furColor = furColor;
//         this.age = age;
//     }

// }



// public class Cat extends Pet{
//     @Override
//     public void bark(){
//         System.out.println("喵喵喵");
//     }
// }