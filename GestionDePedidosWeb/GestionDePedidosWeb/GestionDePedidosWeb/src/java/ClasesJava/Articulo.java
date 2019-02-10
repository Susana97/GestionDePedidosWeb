package ClasesJava;

public class Articulo {
    
    private String codigo_a;
    private String descripcion;
    private float unidades;
    private float precio;

    public Articulo(String codigo_a, String descripcion, float unidades, float precio) {
        this.codigo_a = codigo_a;
        this.descripcion = descripcion;
        this.unidades = unidades;
        this.precio = precio;
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

    public float getUnidades() {
        return unidades;
    }

    public void setUnidades(float unidades) {
        this.unidades = unidades;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Articulo{" + "codigo_a=" + codigo_a + ", descripcion=" + descripcion + ", unidades=" + unidades + ", precio=" + precio + '}';
    }

    
}
