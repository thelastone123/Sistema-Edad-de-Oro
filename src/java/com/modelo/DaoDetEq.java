 
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andrés Alfaro
 */
public class DaoDetEq extends Conexion
{
    public List<DetEquipo> mostrar() throws Exception
    {
        List<DetEquipo> lista = new ArrayList();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from detalleEquipo;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                DetEquipo d = new DetEquipo();
                d.setIdEquipo(rs.getInt("idEquipo"));
                d.setFechaIngreso(rs.getString("fechaIngreso"));
                d.setFechaNacimiento(rs.getString("fechaNacimiento"));
                d.setHasDetail(rs.getInt("hasDetail"));
                
                lista.add(d);
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return lista;
    }
    
    public void insertar(DetEquipo d) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "insert into detalleEquipo values(?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, d.getIdEquipo());
            pre.setString(2, d.getFechaIngreso());
            pre.setString(3, d.getFechaNacimiento());
            pre.setInt(4, d.getHasDetail());
                    
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void replaceDetail(DetEquipo d) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update equipo set hasDetail = ? where id = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, d.getHasDetail());
            pre.setInt(2, d.getIdEquipo());
            
            pre.executeUpdate();
        }
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modificar(DetEquipo d) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update detalleEquipo set fechaIngreso=?,fechaNacimiento=?,"
                    + "hasDetail=? where idEquipo=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setString(1, d.getFechaIngreso());
            pre.setString(2, d.getFechaNacimiento());
            pre.setInt(3, d.getHasDetail());
            pre.setInt(4, d.getIdEquipo());
            
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminar(DetEquipo d) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "delete from detalleEquipo where idEquipo=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, d.getIdEquipo());
            
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public DetEquipo getDetEq(int id) throws Exception
    {
        DetEquipo d = new DetEquipo();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from detalleEquipo where idEquipo = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                d.setIdEquipo(rs.getInt("idEquipo"));
                d.setFechaIngreso(rs.getString("fechaIngreso"));
                d.setFechaNacimiento(rs.getString("fechaNacimiento"));
                d.setHasDetail(rs.getInt("hasDetail"));
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return d;
    }
}
