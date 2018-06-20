package blog.repository;

import blog.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {

    User findByUsername(String username);

    User findByUsernameOrEmailAddress(String username, String emailAddress);
}
