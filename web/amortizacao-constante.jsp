<%-- 
    Document   : amotizacao-constante
    Created on : 02/09/2018, 12:00:12
    Author     : usuario
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Amortização Constante</title>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body class="bg-light">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center my-5">
                    <h1 class="display-3">Amortização Constante</h1>           
                </div>
            </div>
            <div class="row">
                <div class="col-6 my-3">
                    <h2>Preencha o Formulário</h2>
                    <form method="get">
                        <div class="form-group">
                            <label>Valor: </label>
                            <input type="text" class="form-control" name="valor" placeholder="R$">
                        </div>
                        <div class="form-group">
                            <label>Juros (%): </label>
                            <input type="text" class="form-control" name="juros">
                        </div>
                        <div class="form-group">
                            <label>Tempo: </label>
                            <input type="text" class="form-control" name="tempo" placeholder="Meses">
                        </div>
                        <input class="btn botaoForm mb-4" type="submit" value="Gerar" name="calcular"/>
                    </form>
                </div>
                <div class="col-6 my-3">
                    <h2>Tabela Resultado</h2>     

                    <%
                        if (request.getParameter("calcular") != null && request.getParameter("valor") != "" && request.getParameter("tempo") != "" && request.getParameter("juros") != null) {
                            DecimalFormat decimalFormat = new DecimalFormat();
                            decimalFormat.setMaximumFractionDigits(2);

                            double valor = Double.parseDouble(request.getParameter("valor"));
                            double taxa = Double.parseDouble(request.getParameter("juros")) / 100;
                            double tempo = Double.parseDouble(request.getParameter("tempo"));
                            double amortizacao = valor / tempo;
                            double parcelas, juros;
                            double saldoDevedor = valor, jurosAcu = 0, amortizacaoAcu = 0, parcelasAcu = 0;
                    %>
                    <table class="table table-hover">
                        <thead class="legenda">
                            <tr>
                                <th>#</th>
                                <th>Parcelas</th>
                                <th>Amortizações</th>
                                <th>Juros</th>
                                <th>Saldo Devedor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 1; i <= tempo + 1; i++) {%>
                            <tr>
                                <% if (i == tempo + 1) {%>
                                <th class="table-active" scope="row"><%= "="%></th>
                                <td class="table-active"><%= decimalFormat.format(parcelasAcu)%></td>
                                <td class="table-active"><%= decimalFormat.format(amortizacaoAcu)%></td>
                                <td class="table-active"><%= decimalFormat.format(jurosAcu)%></td>
                                <td class="table-active"><%= "Total"%></td>
                                <% } else {%>
                                <th scope="row"><%= i%></th>
                                <td><% juros = saldoDevedor * taxa;
                                    parcelas = amortizacao + juros;
                                    parcelasAcu += parcelas;%> <%= decimalFormat.format(parcelas)%></td>
                                <td><%= decimalFormat.format(amortizacao)%> <% amortizacaoAcu += amortizacao;%></td>
                                <td><%= decimalFormat.format(juros)%> <% jurosAcu += juros; %></td>
                                <td><% saldoDevedor -= amortizacao;%> <%= decimalFormat.format(saldoDevedor)%></td>
                                <% } %>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% }%> 
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
