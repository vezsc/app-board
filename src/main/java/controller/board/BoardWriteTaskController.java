package controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Board;
import data.User;

@WebServlet("/board/write-task")
public class BoardWriteTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		
		User logonUser = (User) req.getSession().getAttribute("logonUser");		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		if (title == null || content ==null) {
			resp.sendRedirect("/booard/write?cause=error");
			return;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		if (logonUser == null) {
			String boardPass = req.getParameter("boardPass");
			if (boardPass == null) {
				resp.sendRedirect("/booard/write?cause=error2");
				return;
			}
			String writer = req.getParameter("writer");
			map.put("boardPass", boardPass);
			map.put("writer", writer);
			sqlSession.insert("boards.create", map);
		}else {
			String userId = logonUser.getId();
			String writer = logonUser.getNick();
			map.put("userId", userId);
			map.put("writer", writer);
			sqlSession.insert("boards.createLogin", map);
		}
		sqlSession.commit();
		sqlSession.close();
		
		resp.sendRedirect("/board/list");
	}
}
