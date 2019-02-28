 
package com.controlador;

import com.modelo.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Andrés Alfaro
 */

public class ProcesarDetMiem extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DaoDetMiem dao = new DaoDetMiem();
        DaoMiembros daoM = new DaoMiembros();
        DetMiem dm = new DetMiem();
        RequestDispatcher rd = null;
        String msj = "";
        try 
        {
            dm.setIdMiembro(Integer.parseInt(request.getParameter("miem")));
            dm.setFechaIngreso(request.getParameter("txtFechaIn"));
            dm.setFechaNacimiento(request.getParameter("txtFechaNac"));

            dm.setMedicamentos(request.getParameter("txtMedicamentos"));
            dm.setDiscapacidad(request.getParameter("txtDiscapacidad"));
            dm.setEnfermedad(request.getParameter("txtEnfermedad"));
            dm.setNombreEmergencia(request.getParameter("txtContacto"));
            dm.setParentesco(request.getParameter("txtParentesco"));
            dm.setTelefonoEmergencia(request.getParameter("txtTelEmerg"));
            dm.setHasDetail(Integer.parseInt(request.getParameter("detail")));
            
            if(request.getParameter("btnInsertar") != null)
            {
                dao.insertar(dm);
                dao.replaceDetail(dm);
                msj = "Datos Completos.";
            }
            else if(request.getParameter("btnModificar") != null)
            {
                dao.modificar(dm);
                msj = "Datos Editados.";
            }
            else
            {
                dao.eliminar(dm);
                msj = "Datos Eliminados.";
            }
            rd = request.getRequestDispatcher("miembros.jsp");
            request.setAttribute("msj", msj);
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
