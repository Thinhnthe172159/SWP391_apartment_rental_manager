/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dal;

import vn.fpt.edu.dal.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.CommunityPost;
import vn.fpt.edu.model.Post_image;
import vn.fpt.edu.model.User;
import java.sql.SQLException;
import vn.fpt.edu.model.CommentPost;
import vn.fpt.edu.model.LikePost;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class CommunityPostDao extends DBContext {

    private UserDao userDao = new UserDao();
//add post 

    public void addPost(CommunityPost cp) {
        String query = "INSERT INTO [dbo].[Community_post]\n"
                + "           ([tittle]\n"
                + "           ,[context]\n"
                + "           ,[user_id]\n"
                + "           ,[time],[first_image],[status])\n"
                + " VALUES    (?,?,?,?,?,?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, cp.getTitle());
            statement.setString(2, cp.getContext());
            statement.setInt(3, cp.getUser_id().getId());
            statement.setDate(4, cp.getTime());
            statement.setString(5, cp.getFirst_image());
            statement.setInt(6, cp.getStatus());

            statement.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    // hàm lấy ra danh sách ảnh của 1 bài đăng\
    public List<Post_image> getPostImageByPostId(int post_id) {
        List<Post_image> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[image]\n"
                + "      ,[post_id]\n"
                + "  FROM [dbo].[Image_post] where [post_id] = ? order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CommunityPost communityPost = getCommunityPost(rs.getInt("post_id"));
                Post_image p = new Post_image(0, rs.getString("image"), communityPost);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Hàm này sẽ xóa bài đăng thuộc về 1 user nào đó
    public void deletePost(int postId) {
        String query = "DELETE FROM [dbo].[List_of_post_liked] WHERE [post_id] = ?;\n"
                + "DELETE FROM [dbo].[Comment] WHERE [post_id] = ?;\n"
                + "DELETE FROM [dbo].[Image_post] WHERE [post_id] = ?;\n"
                + "DELETE FROM Community_post WHERE [id] = ? ;";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, postId);
            statement.setInt(2, postId);
            statement.setInt(3, postId);
            statement.setInt(4, postId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // get add post
    public List<CommunityPost> getAllPosts() {
        List<CommunityPost> posts = new ArrayList<>();
        String query = "SELECT * FROM Community_post order by [time] desc , [id] desc ";
        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                CommunityPost cp = new CommunityPost();
                cp.setId(rs.getInt("id"));
                cp.setContext(rs.getString("context"));
                cp.setTitle(rs.getString("tittle"));
                User userId = userDao.getUser(rs.getInt("user_id"));
                cp.setUser_id(userId);
                cp.setTime(rs.getDate("time"));
                cp.setFirst_image(rs.getString("first_image"));
                cp.setNum_of_view(rs.getInt("num_of_view"));
                cp.setNum_of_like(rs.getInt("num_of_like"));
                cp.setNum_of_comment(rs.getInt("num_of_comment"));
                cp.setStatus(rs.getInt("status"));
                posts.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    // đây là list tìm kiếm có thể phân trang
    public List<CommunityPost> searchCommunityPostsList(String title, int user_id, int pageNumber, int pageSize) {
        List<CommunityPost> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Community_post] WHERE 1 = 1 and [status] = 1  ";

        if (title != null) {
            sql += " and [tittle] like N'%" + title + "%'";
        }
        if (user_id != 0) {
            sql += " and [user_id] =" + user_id;
        }
        sql += "   ORDER BY [id] DESC , [time] desc ";
        int offset = (pageNumber - 1) * pageSize;

        sql += "OFFSET " + offset + " ROWS ";
        sql += "FETCH NEXT " + pageSize + " ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CommunityPost cp = new CommunityPost();
                cp.setId(rs.getInt("id"));
                cp.setContext(rs.getString("context"));
                cp.setTitle(rs.getString("tittle"));
                User userId = userDao.getUser(rs.getInt("user_id"));
                cp.setUser_id(userId);
                cp.setTime(rs.getDate("time"));
                cp.setFirst_image(rs.getString("first_image"));
                cp.setNum_of_view(rs.getInt("num_of_view"));
                cp.setNum_of_like(rs.getInt("num_of_like"));
                cp.setNum_of_comment(rs.getInt("num_of_comment"));
                cp.setStatus(rs.getInt("status"));
                list.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // hàm này sẽ lấy ra được kích thước của list vừa mới search
    public int getSizeOfListSearch(String title, int user_id) {

        String sql = "SELECT count (id) as total\n"
                + "  FROM [dbo].[Community_post] where 1=1 and [status] = 1 ";

        if (title != null) {
            sql += " and [tittle] like '%" + title + "%'";
        }
        if (user_id != 0) {
            sql += " and [user_id] = " + user_id;
        }

        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("total");
                return result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // hàm này cho phép chúng ta có thể thay đổi thông tin của bài đăng của chính mình
    public void updatePost(CommunityPost post) {
        String query = "UPDATE [dbo].[Community_post]\n"
                + "   SET [tittle] = ?\n"
                + "      ,[context] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[time] = ?\n"
                + "      ,[num_of_view] = ?\n"
                + "      ,[num_of_like] = ?\n"
                + "      ,[num_of_comment] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [id] = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContext());
            statement.setInt(3, post.getUser_id().getId());
            statement.setDate(4, post.getTime());
            statement.setInt(5, post.getNum_of_view());
            statement.setInt(6, post.getNum_of_like());
            statement.setInt(7, post.getNum_of_comment());
            statement.setInt(8, post.getStatus());
            statement.setInt(9, post.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePost2(CommunityPost post) {
        String query = "UPDATE [dbo].[Community_post]\n"
                + "   SET [tittle] = ?\n"
                + "      ,[context] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[time] = ?\n"
                + "      ,[first_image]= ? \n"
                + "      ,[num_of_view] = ?\n"
                + "      ,[num_of_like] = ?\n"
                + "      ,[num_of_comment] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [id] = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContext());
            statement.setInt(3, post.getUser_id().getId());
            statement.setDate(4, post.getTime());
            statement.setString(5, post.getFirst_image());
            statement.setInt(6, post.getNum_of_view());
            statement.setInt(7, post.getNum_of_like());
            statement.setInt(8, post.getNum_of_comment());
            statement.setInt(9, post.getStatus());
            statement.setInt(10, post.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // lấy ra bài post mới nhất thuộc về 1 user nào đó
    public CommunityPost getNewesPost(int user_id) {
        String sql = "  SELECT TOP (1)*\n"
                + "  FROM [dbo].[Community_post] where [user_id] = ?  order by [id] desc ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, user_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                CommunityPost post = new CommunityPost();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("tittle"));
                post.setContext(rs.getString("context"));
                User user = userDao.getUser(rs.getInt("user_id"));
                post.setUser_id(user);
                post.setTime(rs.getDate("time"));
                post.setStatus(rs.getInt("status"));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // lấy ra 1 bài đăng bất kì
    public CommunityPost getCommunityPost(int id) {
        String sql = " SELECT *\n"
                + "  FROM [dbo].[Community_post] where[id] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                CommunityPost cp = new CommunityPost();
                cp.setId(rs.getInt("id"));
                cp.setContext(rs.getString("context"));
                cp.setTitle(rs.getString("tittle"));
                User userId = userDao.getUser(rs.getInt("user_id"));
                cp.setUser_id(userId);
                cp.setTime(rs.getDate("time"));
                cp.setFirst_image(rs.getString("first_image"));
                cp.setNum_of_view(rs.getInt("num_of_view"));
                cp.setNum_of_like(rs.getInt("num_of_like"));
                cp.setNum_of_comment(rs.getInt("num_of_comment"));
                cp.setStatus(rs.getInt("status"));
                return cp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // thêm ảnh vào trong bài đăng
    public void addPostImage(Post_image post_image) {
        String query = "INSERT INTO [dbo].[Image_post] ([image], [post_id]) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post_image.getImage());
            statement.setInt(2, post_image.getPost_id().getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //lấy ra bức ảnh đầu tiên thuộc về 1 bài đăng nào đó
    public Post_image getFirstPostImage(int post_id) {
        String query = "SELECT top 1 *\n"
                + "  FROM [dbo].[Image_post] where [post_id] = ? order by [id] desc";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, post_id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                CommunityPost communityPost = getCommunityPost(rs.getInt("post_id"));
                Post_image pi = new Post_image(rs.getInt("id"), rs.getString("image"), communityPost);
                return pi;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // xóa toàn bộ ảnh thuôc về 1 bài đăng nào đó
    public void deleteAllImageOfAPost(int post_id) {
        String sql = "DELETE FROM [dbo].[Image_post]\n"
                + "      WHERE [post_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm thêm lượt thích
    public void addLikePost(LikePost likePost) {
        String sql = "INSERT INTO [dbo].[List_of_post_liked]\n"
                + "           ([post_id]\n"
                + "           ,[user_id])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, likePost.getPost_id().getId());
            st.setInt(2, likePost.getUser_id().getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm hủy lượt thích
    public void deleteLikePost(int id, int userId) {
        String sql = "DELETE FROM [dbo].[List_of_post_liked]\n"
                + "      WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm đếm số lượng like 
    public int countLikedPost(int postId) {
        int count = 0;
        String sql = "SELECT count(*) as total FROM [dbo].[List_of_post_liked] WHERE [post_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // hàm kiểm tra xem người nào đã like bài đăng hay chưa
    public LikePost chechLikePost(int post_id, int user_id) {
        String sql = "select * FROM [dbo].[List_of_post_liked] where [user_id] = ? and [post_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, post_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                LikePost likePost = new LikePost();
                likePost.setId(rs.getInt("id"));
                User u = userDao.getUser(rs.getInt("user_id"));
                CommunityPost commentPost = getCommunityPost(rs.getInt("post_id"));
                likePost.setPost_id(commentPost);
                return likePost;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    // hàm lấy ra danh sách mà 1 cá nhân đã like
    public List<LikePost> getListLIkedPost(int user_id) {
        List<LikePost> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[post_id]\n"
                + "      ,[user_id]\n"
                + "  FROM [dbo].[List_of_post_liked] where [user_id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LikePost likePost = new LikePost();
                likePost.setId(rs.getInt("id"));
                CommunityPost cp = getCommunityPost(rs.getInt("post_id"));
                User u = userDao.getUser(rs.getInt("user_id"));
                likePost.setPost_id(cp);
                likePost.setUser_id(u);
                list.add(likePost);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // hàm add commment 
    public void addComment(CommentPost commentPost) {
        String sql = "INSERT INTO [dbo].[Comment]\n"
                + "           ([message]\n"
                + "           ,[user_id]\n"
                + "           ,[post_id]\n"
                + "           ,[time],[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentPost.getMesage());
            st.setInt(2, commentPost.getUser_id().getId());
            st.setInt(3, commentPost.getPost_id().getId());
            Timestamp timestamp = Timestamp.valueOf(commentPost.getTime());
            st.setTimestamp(4, timestamp);
            st.setInt(5, commentPost.getStatus());
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm xóa commment
    public void deleteComment(int PostId) {
        String sql = "DELETE FROM [dbo].[Comment]\n"
                + "      WHERE [id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PostId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm sửa commment
    public void updateComment(CommentPost commentPost) {
        String sql = "UPDATE [dbo].[Comment]\n"
                + "   SET [message] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[post_id] = ?\n"
                + "      ,[status] = ? \n"
                + " WHERE [id] = ? and [user_id]= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentPost.getMesage());
            st.setInt(2, commentPost.getUser_id().getId());
            st.setInt(3, commentPost.getPost_id().getId());
            st.setInt(4, commentPost.getStatus());
            st.setInt(5, commentPost.getId());
            st.setInt(6, commentPost.getUser_id().getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //hàm nay sẽ lấy ra danh sách các comment thuộc về 1 bài đăng nào đấy
    public List<CommentPost> getListCommentOfPost(int post_id) {
        List<CommentPost> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[message]\n"
                + "      ,[user_id]\n"
                + "      ,[post_id]\n"
                + "      ,[time],[status]\n"
                + "  FROM [dbo].[Comment] where [post_id] = ? order by [time] desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String message = rs.getString("message");
                User u = userDao.getUser(rs.getInt("user_id"));
                CommunityPost communityPost = getCommunityPost(rs.getInt("post_id"));
                Timestamp timestamp = rs.getTimestamp("time");
                LocalDateTime time = timestamp.toLocalDateTime();

                CommentPost cp = new CommentPost(id, message, u, communityPost, time, rs.getInt("status"));
                list.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public CommentPost getCommentById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[message]\n"
                + "      ,[user_id]\n"
                + "      ,[post_id]\n"
                + "      ,[time],[status]\n"
                + "  FROM [dbo].[Comment] where [id] = ? order by [time] desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int ids = rs.getInt("id");
                String message = rs.getString("message");
                User u = userDao.getUser(rs.getInt("user_id"));
                CommunityPost communityPost = getCommunityPost(rs.getInt("post_id"));
                Timestamp timestamp = rs.getTimestamp("time");
                LocalDateTime time = timestamp.toLocalDateTime();

                CommentPost cp = new CommentPost(ids, message, u, communityPost, time, rs.getInt("status"));
                return cp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // hàm đếm số lượng comment
    public int countCommentEachPost(int post_id) {
        int count = 0;
        String sql = "SELECT count(id) as total \n"
                + "  FROM [dbo].[Comment] where [post_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        CommunityPostDao cpd = new CommunityPostDao();

        Post_image p = cpd.getFirstPostImage(42);
        System.out.println(p.getImage());

    }
}
