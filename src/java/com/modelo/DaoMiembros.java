 
package com.modelo;

import java.sql.*;
import java.util.*;
import com.conexion.Conexion;

/**
 *
 * @author Andrés Alfaro
 */
public class DaoMiembros extends Conexion{
    public List<Miembros> mostrar() throws Exception
    {
        List<Miembros> lista = new ArrayList();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql = "select * from miembros where estado = 1 OR estado = 2;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                Miembros m = new Miembros();
                DetMiem dm = new DetMiem();
                m.setId(rs.getInt("id"));
                m.setNombres(rs.getString("nombres"));
                m.setApellidos(rs.getString("apellidos"));
                m.setTelefono(rs.getString("telefono"));
                m.setEdad(rs.getInt("edad"));
                m.setDui(rs.getString("dui"));
                m.setDireccion(rs.getString("direccion"));
                m.setEstado(rs.getInt("estado"));
                m.setHasDetail(rs.getInt("hasDetail"));
                
                lista.add(m);
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
    
    public List<Miembros> filtrar() throws Exception
    {
        List<Miembros> lista = new ArrayList();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql ="call mostrar()";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                Miembros m = new Miembros();
                m.setId(rs.getInt("id"));
                m.setNombres(rs.getString("nombres"));
                m.setApellidos(rs.getString("apellidos"));
                m.setTelefono(rs.getString("telefono"));
                m.setEdad(rs.getInt("edad"));
                m.setDui(rs.getString("dui"));
                m.setDireccion(rs.getString("direccion"));
                m.setEstado(rs.getInt("estado"));
                m.setHasDetail(rs.getInt("hasDetail"));
                
                lista.add(m);
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
    
    public void insertar(Miembros m) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "insert into miembros values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, 0);
            pre.setString(2, m.getNombres());
            pre.setString(3, m.getApellidos());
            pre.setString(4, m.getTelefono());
            pre.setInt(5, m.getEdad());
            pre.setString(6, m.getDui());
            pre.setString(7, m.getDireccion());
            pre.setInt(8, m.getEstado());
            pre.setInt(9, m.getHasDetail());
            
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
    
    public void modificar(Miembros m) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update miembros set nombres=?,apellidos=?,telefono=?,"
                    + "edad=?,dui=?,direccion=?,estado=?, hasDetail=? where id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setString(1, m.getNombres());
            pre.setString(2, m.getApellidos());
            pre.setString(3, m.getTelefono());
            pre.setInt(4, m.getEdad());
            pre.setString(5, m.getDui());
            pre.setString(6, m.getDireccion());
            pre.setInt(7, m.getEstado());
            pre.setInt(8, m.getHasDetail());
            pre.setInt(9, m.getId());
            
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
    
    public void eliminar(Miembros m) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "update miembros set estado = 3 where id = ?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            pre.setInt(1, m.getId());
            
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
    
    public Miembros getMiembro(int id) throws Exception
    {
        Miembros m = new Miembros();
        ResultSet rs;
        
        try 
        {
            this.conectar();
            String sql ="select * from miembros where id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
            
            while(rs.next())
            {
                m.setId(rs.getInt("id"));
                m.setNombres(rs.getString("nombres"));
                m.setApellidos(rs.getString("apellidos"));
                m.setTelefono(rs.getString("telefono"));
                m.setEdad(rs.getInt("edad"));
                m.setDui(rs.getString("dui"));
                m.setDireccion(rs.getString("direccion"));
                m.setEstado(rs.getInt("estado"));            
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
        
        return m;
    }
}
