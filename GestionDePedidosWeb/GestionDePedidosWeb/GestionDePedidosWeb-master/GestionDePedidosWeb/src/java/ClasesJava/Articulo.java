package ClasesJava;

public class Articulo {
    
    private String codigo_a;
    private String descripcion;
    private float stock;
    private float stock_minimo;
    private float precioCompra;
    private float precioVenta;

    public Articulo(String codigo_a, String descripcion, float stock, float stock_minimo, float precioCompra, float precioVenta) {
        this.codigo_a = codigo_a;
        this.descripcion = descripcion;
        this.stock = stock;
        this.stock_minimo = stock_minimo;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
    }

    public String getCodigo_a() {
        return codigo_a;
    }

    public void setCodigo_a(String codigo_a) {
        this.codigo_a = codigo_a;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getStock() {
        return stock;
    }

    public void setStock(float stock) {
        this.stock = stock;
    }

    public float getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(float stock_minimo) {
        this.stock_minimo = stock_minimo;
    }

    public float getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(float precioCompra) {
        this.precioCompra = precioCompra;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    @Override
    public String toString() {
        return "Articulo{" + "codigo_a=" + codigo_a + ", descripcion=" + descripcion + ", stock=" + stock + ", stock_minimo=" + stock_minimo + ", precioCompra=" + precioCompra + ", precioVenta=" + precioVenta + '}';
    }
}
