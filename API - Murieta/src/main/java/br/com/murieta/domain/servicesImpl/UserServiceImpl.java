package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.ConnectionsRepository;
import br.com.murieta.domain.dto.SignUpDTO;
import br.com.murieta.domain.models.Connections;
import br.com.murieta.domain.service.UserService;
import br.com.murieta.data.repositories.RoleRepository;
import br.com.murieta.data.repositories.UserRepository;
import br.com.murieta.domain.models.Role;
import br.com.murieta.domain.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ConnectionsRepository connectionsRepository;

    @Override
    public User signUp(SignUpDTO signUpDTO) {

        if (signUpDTO.getEmail() == null)
            throw new IllegalArgumentException("Não foi possível concluir o cadastro. Campo e-mail, obrigatório");

        if (signUpDTO.getNome() == null)
            throw new IllegalArgumentException("Não foi possível concluir o cadastro. Campo nome, obrigatório");

        if (signUpDTO.getPassword() == null)
            throw new IllegalArgumentException("Não foi possível concluir o cadastro. Campo senha, obrigatório");

        if (signUpDTO.getPasswordConfirm() == null)
            throw new IllegalArgumentException("Não foi possível concluir o cadastro. Campo confirmar senha, obrigatório");

        if (userRepository.findByEmail(signUpDTO.getEmail()) != null)
            throw new IllegalArgumentException("O e-mail informado já possui um cadastro no sistema");

        if (signUpDTO.getPassword().length() < 4)
            throw new IllegalArgumentException("A senha precisa ter mais de 4 caracteres");

        if (signUpDTO.getPasswordConfirm().intern() != signUpDTO.getPassword().intern())
            throw new IllegalArgumentException("A senha digitada é diferente da senha de confirmação");

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        Role role = roleRepository.findById(2).get();
        Set<Role> roles = new HashSet<>();
        roles.add(role);

        Connections connections = new Connections();
        connections = connectionsRepository.save(connections);

        User user = new User();
        user.setEmail(signUpDTO.getEmail());
        user.setName(signUpDTO.getNome());
        user.setPassword(encoder.encode(signUpDTO.getPassword()));
        user.setAccountNonExpired(true);
        user.setAccountNonLocked(true);
        user.setCredentialsNonExpired(true);
        user.setEnabled(true);
        user.setRoles(roles);
        user.setConnections(connections);

        return userRepository.save(user);
    }

    @Override
    public User updateUser(User user) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();

        currentUser = userRepository.findById(currentUser.getId()).get();

        if(user.getPassword() != null)
            throw new IllegalArgumentException("A senha não deve ser informada para atualizar dados do usuario");

        if(user.getName() != null)
            currentUser.setName(user.getName());

        if (userRepository.findByEmail(user.getEmail()) != null)
            throw new IllegalArgumentException("O e-mail informado já possui um cadastro no sistema");

        if(user.getEmail() != null)
            currentUser.setEmail(user.getEmail());
        
        return userRepository.save(currentUser);
    }

    public User updatePassword(SignUpDTO userUpadtePassword) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();

        currentUser = userRepository.findById(currentUser.getId()).get();

        if (userUpadtePassword.getPasswordConfirm() == null)
            throw new IllegalArgumentException("Não foi possível concluir o cadastro. Campo confirmar senha, obrigatório");

        if (userRepository.findByEmail(userUpadtePassword.getEmail()) != null)
            throw new IllegalArgumentException("O e-mail informado já possui um cadastro no sistema");

        if (userUpadtePassword.getPassword().length() < 4)
            throw new IllegalArgumentException("A senha precisa ter mais de 4 caracteres");

        if (userUpadtePassword.getPasswordConfirm().intern() != userUpadtePassword.getPassword().intern())
            throw new IllegalArgumentException("A senha digitada é diferente da senha de confirmação");

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        currentUser.setPassword(encoder.encode(userUpadtePassword.getPassword()));

        return userRepository.save(currentUser);
    }

}
