import 'package:login_clone/model/produk_model.dart';
import 'package:get/get.dart';

class ListProdukController extends GetxController {
  List<ProdukModel> listProduk = [
    ProdukModel(
      nama: "Samsung Galaxy Fold", 
      harga: "10 juta",
      deskripsi: "Samsung Galaxy Fold adalah smartphone lipat yang inovatif dengan layar fleksibel dan desain futuristik. Perangkat ini menawarkan pengalaman multitasking yang unik dan portabilitas yang tinggi.",
      gambar: "https://images.unsplash.com/photo-1580910051074-3eb694886505?w=600&auto=format&fit=crop",
      review: "4.5/5",
      rating: "4.5",
      toko: "Samsung Official Store"
    ),
    ProdukModel(
      nama: "iPhone 20", 
      harga: "25 juta",
      deskripsi: "iPhone 20 adalah smartphone terbaru dari Apple yang menghadirkan teknologi canggih, desain elegan, dan performa tinggi.",
      gambar: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop",
      review: "4.8/5",
      rating: "4.8",
      toko: "Apple Official Store"
    ),
    ProdukModel(
      nama: "Laptop ROG", 
      harga: "30 juta",
      deskripsi: "Laptop ROG adalah komputer gaming high-end yang dirancang untuk memberikan performa terbaik dalam berbagai aktivitas, termasuk gaming dan multitasking.",
      gambar: "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop",
      review: "4.7/5",
      rating: "4.7",
      toko: "ASUS Official Store"
    ),
    ProdukModel(
      nama: "PS 5",
      harga: "8 juta",
      deskripsi: "PlayStation 5 adalah konsol game terbaru dari Sony yang menawarkan pengalaman bermain game yang luar biasa dengan grafis tinggi.",
      gambar: "https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=600&auto=format&fit=crop",
      review: "4.6/5",
      rating: "4.6",
      toko: "Sony Official Store"
    ),
    ProdukModel(
      nama: "Smart TV Android", 
      harga: "10 juta",
      deskripsi: "Smart TV Android adalah televisi pintar yang dilengkapi dengan sistem operasi Android, memungkinkan pengguna untuk mengakses berbagai aplikasi dan konten digital.",
      gambar: "https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=600&auto=format&fit=crop",
      review: "4.4/5",
      rating: "4.4",
      toko: "Samsung Official Store"
    ),
  ];
}