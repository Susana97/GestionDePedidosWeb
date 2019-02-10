package ClasesJava;

public class PedidosInternet {

    private String articulo;
    private String cliente;
    private float unidades;
    private String fecha;

    public PedidosInternet(String articulo, String cliente, float unidades, String fecha) {
        this.articulo = articulo;
        this.cliente = cliente;
        this.unidades = unidades;
        this.fecha = fecha;
    }

    public String getArticulo() {
        return articulo;
    }

    public void setArticulo(String articulo) {
        this.articulo = articulo;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public float getUnidades() {
        return unidades;
    }

    public void setUnidades(float unidades) {
        this.unidades = unidades;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "PedidosInternet{" + "articulo=" + articulo + ", cliente=" + cliente + ", unidades=" + unidades + ", fecha=" + fecha + '}';
    }
}
