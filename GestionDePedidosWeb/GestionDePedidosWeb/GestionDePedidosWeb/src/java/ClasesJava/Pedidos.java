package ClasesJava;

public class Pedidos {

    private String articulo;
    private String descripcion;
    private float precio;
    private float unidades;
    private float importe;

    public Pedidos(String articulo, String descripcion, float precio, float unidades, float importe) {
        this.articulo = articulo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.unidades = unidades;
        this.importe = importe;
    }

    public String getArticulo() {
        return articulo;
    }

    public void setArticulo(String articulo) {
        this.articulo = articulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public float getUnidades() {
        return unidades;
    }

    public void setUnidades(float unidades) {
        this.unidades = unidades;
    }

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }

    @Override
    public String toString() {
        return "Pedidos{" + "articulo=" + articulo + ", descripcion=" + descripcion + ", precio=" + precio + ", unidades=" + unidades + ", importe=" + importe + '}';
    }
}
