 
package com.modelo;

import java.sql.*;
import com.conexion.Conexion;

/**
 *
 * @author Andrés Alfaro
 */
public class DaoUsuario extends Conexion{
    public int validarUsuario(Usuarios us) throws Exception
    {
        int nivel = 0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql = "select nivel from usuarios where usuario=? and pass=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, us.getUsuario());
            pre.setString(2, us.getPass());
            
            res = pre.executeQuery();
            
            while(res.next())
            {
                nivel = res.getInt(1);
            }
            res.close();
        }
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return nivel;
    }
}
