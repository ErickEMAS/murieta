package br.com.murieta.core.seeders;

import br.com.murieta.data.repositories.RoleRepository;
import br.com.murieta.data.repositories.UserRepository;
import br.com.murieta.domain.models.Role;
import br.com.murieta.domain.models.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Slf4j
@Component
public class InitSeeder {
    private static RoleRepository roleRepository;
    private static UserRepository userRepository;

    private User userAdmin;
    private Role roleAdmin;
    private Role roleUser;

    @Autowired
    public InitSeeder(
            RoleRepository _roleRepository,
            UserRepository _userRepository
    ) {
        this.roleRepository = _roleRepository;
        this.userRepository = _userRepository;
    }

    @EventListener
    public void seed(ContextRefreshedEvent event) {
        System.out.println("Event Seed Started");

        if (roleRepository.findAll().size() == 0) {
            seedAppConfig();
            seedUserTable();
        }

        System.out.println("Event Seed Ended");
    }

    private void seedAppConfig() {
        this.roleAdmin = new Role();
        this.roleAdmin.setName("ROLE_ADMIN");
        this.roleAdmin = roleRepository.save(roleAdmin);

        this.roleUser = new Role();
        this.roleUser.setName("ROLE_USER");
        this.roleUser = roleRepository.save(roleUser);

        log.info("Roles seeded");

        log.info("Config seeded");

    }

    private void seedUserTable() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        User user = new User();
        user.setEmail("admin@murieta.com.br");
        user.setPassword(bCryptPasswordEncoder.encode("123456"));
        user.setName("Admin");
        user.setEnabled(true);
        user.setAccountNonExpired(true);
        user.setCredentialsNonExpired(true);
        user.setAccountNonLocked(true);

        Set<Role> setRoles = new HashSet<>();
        setRoles.add(roleAdmin);
        user.setRoles(setRoles);

        userRepository.save(user);

        log.info("Users and Players Seeded");
    }

}


