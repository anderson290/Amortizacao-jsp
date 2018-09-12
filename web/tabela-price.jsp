<%-- 
    Document   : tabela-price
    Created on : 02/09/2018, 12:00:43
    Author     : usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>        
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body class="bg-light">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center my-5">
                    <h1 class="display-3">Tabela Price</h1>           
                </div>
            </div>
            <div class="row">
                <div class="col-6 my-3">
                    <h2>Preencha o Formulário</h2>
                    <form method="GET">
                        <div class="form-group">
                            <label for="pv">Saldo Devedor:</label>
                            <input class="form-control" type="text" name="pv" placeholder="R$" required/>            
                        </div>
                        <div class="form-group">
                            <label for="taxa">Taxa(%):</label>
                            <input class="form-control" type="text" name="taxa" required/>            
                        </div>

                        <div class="form-group">
                            <label for="periodos">Período:</label>
                            <input class="form-control" type="text" name="periodos" placeholder="Meses" required/>
                        </div>
                        <input class="btn botaoForm mb-4" type="submit" value="Gerar"/>

                    </form>
                </div>
                <div class="col-6 my-3">
                    <h2>Tabela Resultado</h2>
                    <%
                        if ((request.getParameter("pv") != null) && (request.getParameter("taxa") != null) && (request.getParameter("periodos") != null)) {
                            double pv = Double.parseDouble(request.getParameter("pv"));

                            double taxa = Double.parseDouble(request.getParameter("taxa"));

                            taxa = taxa / 100;
                            double n = Double.parseDouble(request.getParameter("periodos"));
                            DecimalFormat decimalFormat = new DecimalFormat();
                            decimalFormat.setMaximumFractionDigits(2);
                            double totalP = 0.0;
                            double totalPmt = 0.0;
                            double totalJ = 0.0;
                            double totalAmo = 0.0;
                            double pmt = 0.0, juros = 0.0, amotizacao = 0.0, pvN = 0.0;
                            int counter = 0;
                    %>
                    <table class="table table-hover">
                        <thead class="legenda">

                            <tr>                   
                                <th>Períodos</th>
                                <th>Saldo devedor(Pv)</th>
                                <th>Parcela</th>
                                <th>Juros</th>
                                <th>Amortização</th>

                            </tr>

                        </thead>            
                        <tbody>
                            <%
                                pmt = pv * (((Math.pow((1 + taxa), n)) * taxa) / (((Math.pow((1 + taxa), n)) - 1)));
                                for (int i = 0; i <= n; i++) {

                                    if (i == 0) {%>
                            <tr>         
                                <td><%=i%></td>
                                <td><%=pv%></td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <%
                            } else {
                                juros = pv * taxa;
                                amotizacao = pmt - juros;
                                pv = pv - amotizacao;

                            %>
                            <tr>
                                <td><%=decimalFormat.format(i)%></td>                  
                                <td><%=decimalFormat.format(pv)%></td>
                                <td><%=decimalFormat.format(pmt)%></td>
                                <td><%=decimalFormat.format(juros)%></td>
                                <td><%=decimalFormat.format(amotizacao)%></td>
                            </tr>

                            <%
                                    }

                                    totalP = pv;
                                    totalP = totalP - pv;

                                    totalJ = totalJ + juros;
                                    totalAmo = totalAmo + amotizacao;
                                    counter = i;
                                    totalPmt = i * pmt;
                                }

                            %>
                            <tr>
                                <td>Total</td> 
                                <td><%=decimalFormat.format(totalP)%></td>
                                <td><%=decimalFormat.format(totalPmt)%></td>
                                <td><%=decimalFormat.format(totalJ)%></td>
                                <td><%=decimalFormat.format(totalAmo)%></td>
                            </tr>

                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
