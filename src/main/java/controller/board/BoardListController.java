package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Board;
import data.User;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		User logonUser = (User) req.getSession().getAttribute("logonUser");

		List<Board> list = sqlSession.selectList("boards.findByWrited");
		req.setAttribute("list", list);
		String arr = req.getParameter("arr");
		if (arr == null) {			
		} else {
			if (arr.equals("views")) {
				list = sqlSession.selectList("boards.findByViews");
				req.setAttribute("list", list);
			} else if (arr.equals("Likes")) {
				list = sqlSession.selectList("boards.findByLikes");
				req.setAttribute("list", list);
			} else {
				list = sqlSession.selectList("boards.findByWrited");
				req.setAttribute("list", list);
			}
		}
		
		
		req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
	}
}
