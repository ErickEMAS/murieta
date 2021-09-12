package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Data
@Entity
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JsonIgnore
    private String password;
    private String email;
    private String name;

    private Boolean AccountNonExpired;
    private Boolean AccountNonLocked;
    private Boolean CredentialsNonExpired;
    private Boolean Enabled;

    @OneToOne
    @JoinColumn(name = "conections_id", referencedColumnName = "id")
    private Connections connections;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return AccountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return AccountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return CredentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return Enabled;
    }

}
