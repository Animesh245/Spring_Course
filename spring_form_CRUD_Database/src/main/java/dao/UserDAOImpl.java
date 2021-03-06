package dao;

import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public Long insert(User user) {
        Long id = -1L;
        Session session = sessionFactory.getCurrentSession();

        try{
            id=(Long) session.save(user);
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.flush();
        return id;
    }

    @Override
    public User getById(Long id) {
        User user = sessionFactory.getCurrentSession().get(User.class, id);
        return user;
    }

    @Override
    public Long update(User user) {
        Long id = -1L;
        Session session = sessionFactory.getCurrentSession();

        try {
            session.saveOrUpdate(user);
            id = user.getId();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.flush();

        return id;
    }

    @Override
    public Long delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        User user = session.load(User.class, id.toString());

        session.delete(user);
        session.flush();

        return id;
    }

    @Override
    public List<User> getAll() {
        Query query = sessionFactory.getCurrentSession().createQuery("FROM User", User.class);
        List<User> userList = query.getResultList();

        return userList;
    }

    @Override
    public List<User> getAllByLocationId(Long locationId) {
        List<User> userList = sessionFactory.getCurrentSession()
                .createQuery("FROM User WHERE location_id = :locationId", User.class)
                .setParameter("locationId", locationId)
                .list();
        return userList;
    }
}
