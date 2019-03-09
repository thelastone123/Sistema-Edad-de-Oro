 
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
public class DaoEquipo extends Conexion
{
    public List<Equipo> mostrar() throws Exception
    {
        List<Equipo> lista = new ArrayList();
        ResultSet rs;

        try {
            this.conectar();
            String sql = "select * from equipo where estado <> 3;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) 
            {
                Equipo e = new Equipo();
                e.setId(rs.getInt("id"));
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setTelefono(rs.getString("telefono"));
                e.setEdad(rs.getInt("edad"));
                e.setDui(rs.getString("dui"));
                e.setDireccion(rs.getString("direccion"));
                e.setTipo(rs.getString("tipo"));
                e.setEstado(rs.getInt("estado"));
                e.setHasDetail(rs.getInt("hasDetail"));

                lista.add(e);
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

    public List<Equipo> filtrar() throws Exception 
    {
        List<Equipo> lista = new ArrayList();
        ResultSet rs;

        try {
            this.conectar();
            String sql = "select * from equipo where hasDetail = 2 and estado <> 3;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setId(rs.getInt("id"));
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setTelefono(rs.getString("telefono"));
                e.setEdad(rs.getInt("edad"));
                e.setDui(rs.getString("dui"));
                e.setDireccion(rs.getString("direccion"));
                e.setTipo(rs.getString("tipo"));
                e.setEstado(rs.getInt("estado"));
                e.setHasDetail(rs.getInt("hasDetail"));

                lista.add(e);
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

    public void insertar(Equipo eq) throws Exception 
    {
        try 
        {
            this.conectar();
            String sql = "insert into equipo values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setInt(1, 0);
            pre.setString(2, eq.getNombres());
            pre.setString(3, eq.getApellidos());
            pre.setString(4, eq.getTelefono());
            pre.setInt(5, eq.getEdad());
            pre.setString(6, eq.getDui());
            pre.setString(7, eq.getDireccion());
            pre.setString(8, eq.getTipo());
            pre.setInt(9, eq.getEstado());
            pre.setInt(10, eq.getHasDetail());

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

    public void modificar(Equipo eq) throws Exception 
    {
        try {
            this.conectar();
            String sql = "update equipo set nombres=?,apellidos=?,telefono=?,"
                    + "edad=?,dui=?,direccion=?,tipo=?,estado=?, hasDetail=? where id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setString(1, eq.getNombres());
            pre.setString(2, eq.getApellidos());
            pre.setString(3, eq.getTelefono());
            pre.setInt(4, eq.getEdad());
            pre.setString(5, eq.getDui());
            pre.setString(6, eq.getDireccion());
            pre.setString(7, eq.getTipo());
            pre.setInt(8, eq.getEstado());
            pre.setInt(9, eq.getHasDetail());
            pre.setInt(10, eq.getId());

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

    public void eliminar(Equipo eq) throws Exception 
    {
        try 
        {
            this.conectar();
            String sql = "update equipo set estado = 3 where id = ?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setInt(1, eq.getId());

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

    public Equipo getEquipo(int id) throws Exception 
    {
        Equipo eq = new Equipo();
        ResultSet rs;

        try {
            this.conectar();
            String sql = "select * from equipo where id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();

            while (rs.next()) 
            {
                eq.setId(rs.getInt("id"));
                eq.setNombres(rs.getString("nombres"));
                eq.setApellidos(rs.getString("apellidos"));
                eq.setTelefono(rs.getString("telefono"));
                eq.setEdad(rs.getInt("edad"));
                eq.setDui(rs.getString("dui"));
                eq.setDireccion(rs.getString("direccion"));
                eq.setTipo(rs.getString("tipo"));
                eq.setEstado(rs.getInt("estado"));
                eq.setHasDetail(rs.getInt("hasDetail"));
            }
        } catch (Exception e) 
        {
            throw e;
        } finally 
        {
            this.desconectar();
        }

        return eq;
    }
}
