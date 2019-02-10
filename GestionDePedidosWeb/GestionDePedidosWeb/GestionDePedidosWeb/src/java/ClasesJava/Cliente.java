package ClasesJava;

public class Cliente {
    private String codigo;
    private String nif;
    private String apellidos;
    private String nombre;
    private String domicilio;
    private String codigo_postal;
    private String localidad;
    private String telefono;
    private String movil;
    private String fax;
    private String email;
    private String total_ventas;

    public Cliente(String codigo, String nif, String apellidos, String nombre, String domicilio, String codigo_postal, String localidad, String telefono, String movil, String fax, String email, String total_ventas) {
        this.codigo = codigo;
        this.nif = nif;
        this.apellidos = apellidos;
        this.nombre = nombre;
        this.domicilio = domicilio;
        this.codigo_postal = codigo_postal;
        this.localidad = localidad;
        this.telefono = telefono;
        this.movil = movil;
        this.fax = fax;
        this.email = email;
        this.total_ventas = total_ventas;
    }

    public Cliente(){
        
    }
    
    public String getCodigo() {
        return codigo;
    }

    public String getNif() {
        return nif;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public String getCodigo_postal() {
        return codigo_postal;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getMovil() {
        return movil;
    }

    public String getFax() {
        return fax;
    }

    public String getEmail() {
        return email;
    }

    public String getTotal_ventas() {
        return total_ventas;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public void setCodigo_postal(String codigo_postal) {
        this.codigo_postal = codigo_postal;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setMovil(String movil) {
        this.movil = movil;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTotal_ventas(String total_ventas) {
        this.total_ventas = total_ventas;
    }

    @Override
    public String toString() {
        return "Cliente{" + "codigo=" + codigo + ", nif=" + nif + ", apellidos=" + apellidos + ", nombre=" + nombre + ", domicilio=" + domicilio + ", codigo_postal=" + codigo_postal + ", localidad=" + localidad + ", telefono=" + telefono + ", movil=" + movil + ", fax=" + fax + ", email=" + email + ", total_ventas=" + total_ventas + '}';
    }
    
    
}
