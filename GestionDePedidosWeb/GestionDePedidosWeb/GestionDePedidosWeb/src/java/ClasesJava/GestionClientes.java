package ClasesJava;

import ClasesJava.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionClientes {
    
    private Connection cn;
    
    public GestionClientes() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost/GESTION_DE_ALMACEN", 
                "root", "manager");
        cn.setAutoCommit(false);
    }
    
    public Cliente BuscarClientePorCodigo (String codigo) throws SQLException{
        Cliente cl = null;
        Statement st = cn.createStatement();
        String consulta = "SELECT * FROM CLIENTES WHERE CODIGO = " + codigo;
        ResultSet rs = st.executeQuery(consulta);
        while(rs.next()){
            cl = new Cliente(rs.getString("CODIGO"), rs.getString("NIF"), 
                    rs.getString("APELLIDOS"), rs.getString("NOMBRE"), 
                    rs.getString("DOMICILIO"), rs.getString("CODIGO_POSTAL"),
                    rs.getString("LOCALIDAD"), rs.getString("TELEFONO"), 
                    rs.getString("MOVIL"), rs.getString("FAX"), rs.getString("EMAIL"), 
                    rs.getString("TOTAL_VENTAS"));
        }
        return cl;
    }
    
    public boolean comprobarCodigo (String codigo) throws SQLException{
        boolean existe = false;
        Statement st = cn.createStatement();
        String consulta = "SELECT * FROM CLIENTES WHERE CODIGO = " + codigo;
        ResultSet rs = st.executeQuery(consulta);
        while(rs.next()){
            existe = true;
        }
        return existe;
    }
    
    public void actualizarTotalVentas (float importe, String codigo) throws SQLException{
        //actualiza el total compras por el importe
        Statement st = cn.createStatement();
        String update= "UPDATE CLIENTES SET TOTAL_VENTAS = TOTAL_VENTAS + " + importe +
                "WHERE CODIGO = " + codigo;
        st.executeUpdate(update);
    }
 
    public void commit() throws SQLException{
        cn.commit();
    }
    
    public void rollback() throws SQLException{
        cn.rollback();
    }
}
