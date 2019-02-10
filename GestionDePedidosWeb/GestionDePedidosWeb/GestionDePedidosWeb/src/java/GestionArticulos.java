package Proveedores;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

public class GestionArticulos {
    
    private Connection cn;
    
    public GestionArticulos() throws SQLException {
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GESTION_DE_ALMACEN", 
                "root", "manager");
        cn.setAutoCommit(false);
    }
    
    public Vector<Vector> listarArticulos () throws SQLException{

        Vector<Vector> arrayArticulos = new Vector<Vector>();
        Statement st = cn.createStatement();
        String consulta = "SELECT * FROM ARTICULOS";
        ResultSet rs = st.executeQuery(consulta);
        Vector articulo = new Vector();
        
        while(rs.next()){
            
            articulo.add(rs.getString("CODIGO_A"));
            articulo.add(rs.getString("DESCRIPCION"));
            articulo.add(rs.getFloat("STOCK"));
            articulo.add(rs.getFloat("PRECIO_VENTA"));
        }
        return arrayArticulos;
    }
    
    public ArrayList<Articulo> listarArticulosAL () throws SQLException{

        ArrayList<Articulo> arrayArticulos = new ArrayList<Articulo>();
        Statement st = cn.createStatement();
        String consulta = "SELECT * FROM ARTICULOS";
        ResultSet rs = st.executeQuery(consulta);
        
        while(rs.next()){
            arrayArticulos.add(new Articulo(rs.getString("CODIGO_A"), rs.getString("DESCRIPCION"), rs.getFloat("STOCK"),
                rs.getFloat("STOCK_MINIMO"), rs.getFloat("PRECIO_COMPRA"), rs.getFloat("PRECIO_VENTA")));
        }
        return arrayArticulos;
    }
    
    public Articulo getArticulo(String codigo) throws SQLException{
        Articulo art = null;
        Statement st = cn.createStatement();
        String consultaArt = "SELECT * FROM ARTICULOS WHERE CODIGO_A = " + "\"" + codigo + "\"";
        ResultSet rs = st.executeQuery(consultaArt);
        while(rs.next()){
            art = new Articulo(rs.getString("CODIGO_A"), rs.getString("DESCRIPCION"), 
                rs.getFloat("STOCK"), rs.getFloat("STOCK_MINIMO"), rs.getFloat("PRECIO_COMPRA"),
                rs.getFloat("PRECIO_VENTA"));
        }
        return art;
    }
    
    public void actualizarHistorica (String idCliente, String idProveedor, 
            String idArticulo, float unidades) throws SQLException{
        
        Date fechaActual = new Date();
        java.sql.Date fechaActualSql = new java.sql.Date(fechaActual.getTime());
        
        PreparedStatement pstAct;
        String insertarHis = "INSERT INTO HISTORICA VALUES (?,?,?,?,?)";
        pstAct = cn.prepareStatement(insertarHis);
        pstAct.setString(1, idCliente);
        pstAct.setString(2, idProveedor);
        pstAct.setString(3, idArticulo);
        pstAct.setFloat(4, unidades);
        pstAct.setDate(5, fechaActualSql);
        pstAct.executeUpdate();
    }
    
    public void actualizarStock (String IdArticulo, float unidades, boolean proveedor) throws SQLException{
        //actualiza el stock del articulo.
        Statement stStock = cn.createStatement();
        
        Articulo art = getArticulo(IdArticulo);
        float stock = 0;
        
        if(proveedor == true){
            stock = art.getStock() + unidades;
        }else{
            stock = art.getStock() - unidades;
        }
        
        String updatestock= "UPDATE ARTICULOS SET STOCK = " + stock +
                " WHERE CODIGO_A = " + "\"" + IdArticulo + "\"";
        stStock.executeUpdate(updatestock);
        
    }
    
    public void commit() throws SQLException{
        cn.commit();
    }
    
    public void rollback() throws SQLException{
        cn.rollback();
    }
    
}
