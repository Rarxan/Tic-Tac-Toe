package com.tictactoe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogicServlet", value = "/logic")
public class LogicServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession currentSession = req.getSession();
        Field field = extractField(currentSession);

        int index = getSelectedIndex(req);
        Sign currentSign = field.getField().get(index);

        if (currentSign != Sign.EMPTY) {
            resp.sendRedirect("/index.jsp");
            return;
        }

        field.getField().put(index, Sign.CROSS);

        if (checkWin(resp, currentSession, field)) return;

        int aiMove = field.getAIMove();
        if (aiMove >= 0) {
            field.getField().put(aiMove, Sign.NOUGHT);
            if (checkWin(resp, currentSession, field)) return;
        } else {
            currentSession.setAttribute("draw", true);
        }

        List<Sign> data = field.getFieldData();
        currentSession.setAttribute("data", data);
        currentSession.setAttribute("field", field);

        resp.sendRedirect("/index.jsp");
    }

    private boolean checkWin(HttpServletResponse response, HttpSession currentSession, Field field) throws IOException {
        Sign winner = field.checkWin();
        if (winner == Sign.CROSS || winner == Sign.NOUGHT) {
            currentSession.setAttribute("winner", winner);
            currentSession.setAttribute("data", field.getFieldData());
            response.sendRedirect("/index.jsp");
            return true;
        }
        return false;
    }

    private int getSelectedIndex(HttpServletRequest request) {
        String click = request.getParameter("click");
        return (click != null && click.chars().allMatch(Character::isDigit)) ? Integer.parseInt(click) : 0;
    }

    private Field extractField(HttpSession currentSession) {
        Object fieldAttribute = currentSession.getAttribute("field");
        if (!(fieldAttribute instanceof Field)) {

            Field field = new Field();
            currentSession.setAttribute("field", field);
            currentSession.setAttribute("data", field.getFieldData());
            return field;
        }
        return (Field) fieldAttribute;
    }
}
