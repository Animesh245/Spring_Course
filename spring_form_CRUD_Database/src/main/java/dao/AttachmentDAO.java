package dao;

import entity.Attachment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AttachmentDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public void save(Attachment attachment) {
        Session session = sessionFactory.getCurrentSession();

        try {
             session.save(attachment);
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.flush();
    }

    public Attachment findById(Long id)
    {
        Session session = sessionFactory.getCurrentSession();

        try
        {
            String hql = "FROM Attachment a WHERE a.id =: id";
            Query<Attachment> attachmentQuery = session.createQuery(hql);
            attachmentQuery.setParameter("id", id);
            return attachmentQuery.getSingleResult();
        }catch (Exception e)
        {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return null;
    }

    public void insertBulks(List<Attachment> attachments) {
        Session session = sessionFactory.getCurrentSession();
        try {
            attachments.forEach(session::save);
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.flush();
    }
}
