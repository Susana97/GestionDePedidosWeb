package ClasesJava;

import java.util.Date;

public class Pedido {
    
    private String Cliente;
    private String Articulo;
    private float Unidades;
    private Date fecha;

    public Pedido(String Cliente, String Articulo, float Unidades, Date fecha) {
        this.Cliente = Cliente;
        this.Articulo = Articulo;
        this.Unidades = Unidades;
        this.fecha = fecha;
    }

    public String getCliente() {
        return Cliente;
    }

    public String getArticulo() {
        return Articulo;
    }

    public float getUnidades() {
        return Unidades;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }

    public void setArticulo(String Articulo) {
        this.Articulo = Articulo;
    }

    public void setUnidades(float Unidades) {
        this.Unidades = Unidades;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
