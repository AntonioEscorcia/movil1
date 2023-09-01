import 'package:movil1/movil1.dart' as movil1;

class Producto {
  String nombre;
  double precio;
  DateTime fechaVencimiento;

  Producto(this.nombre, this.precio, this.fechaVencimiento);
}

class ObjetoVentas {
  List productos = [];

  void agregarProducto(Producto producto) {
    productos.add(producto);
  }

  double calcularTotal() {
    double total = 0;
    DateTime hoy = DateTime.now();

    for (var producto in productos) {
      if (producto.fechaVencimiento.difference(hoy).inDays <= 15) {
        double descuento = producto.precio * 0.15;
        total += producto.precio - descuento;
      } else {
        total += producto.precio;
      }
    }

    return total;
  }
}

void main() {
  // Crear objeto de ventas
  ObjetoVentas ventas = ObjetoVentas();

  // Agregar productos
  Producto producto1 = Producto("Producto 1", 10.0, DateTime(2022, 1, 1));
  Producto producto2 = Producto("Producto 2", 20.0, DateTime(2023, 12, 15));
 Producto producto3 = Producto("Producto 3", 40.0, DateTime(2024, 3, 5));
  Producto producto4 = Producto("Producto 4", 70.0, DateTime(2021, 2, 4));

  ventas.agregarProducto(producto1);
  ventas.agregarProducto(producto2);
   ventas.agregarProducto(producto3);
  ventas.agregarProducto(producto4);

  // Calcular total a pagar
  double totalPagar = ventas.calcularTotal();
  print("Total a pagar: $totalPagar");
}