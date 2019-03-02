
package com.controlador;

import com.modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrés Alfaro
 */
public class ProcesarMiembro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        RequestDispatcher rd = null;
        Miembros m = new Miembros();
        DaoMiembros dao = new DaoMiembros();
        String msj = "";
        String action = "";
        int estado = 0;
        String est = "";
        try 
        {
            m.setId(Integer.parseInt(request.getParameter("txtId")));
            m.setNombres(request.getParameter("txtNombres"));
            m.setApellidos(request.getParameter("txtApellidos"));
            m.setTelefono((request.getParameter("txtTelefono")));
            m.setEdad(Integer.parseInt(request.getParameter("edad")));
            m.setDui(request.getParameter("txtDui"));
            m.setDireccion(request.getParameter("txtDireccion"));
            m.setEstado(Integer.parseInt(request.getParameter("estado")));
            m.setHasDetail(Integer.parseInt(request.getParameter("txtDet")));
            
            if(request.getParameter("btnInsertar") != null)
            {
                dao.insertar(m);
                msj = "Miembro agregado correctamente.";
            }
            else if(request.getParameter("btnModificar") != null)
            {
                dao.modificar(m);
                msj = "Miembro modificado correctamente.";
                action = "¿Desea modificar este registro?";
            }
            else if(request.getParameter("btnEliminar") != null)
            {
                dao.eliminar(m);
                msj = "Miembro eliminado correctamente.";
                action = "¿Desea eliminar este registro?";
            }
            rd = request.getRequestDispatcher("miembros.jsp");
            request.setAttribute("msj", msj);
            request.setAttribute("action", action);
        }
        catch (Exception e) 
        {
            request.setAttribute("error", e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
