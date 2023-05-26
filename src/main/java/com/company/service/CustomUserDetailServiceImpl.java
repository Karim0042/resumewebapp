package com.company.service;

import com.company.entity.User;
import com.company.entity.Authority;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userDetailsService")
public class CustomUserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private UserServiceInter userServiceInter;
    private String userEmail;


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        userEmail = email;
        User user = userServiceInter.findByEmail(email);
        UserBuilder userBuilder = null;
        if (user != null) {
            userBuilder = org.springframework.security.core.userdetails.User.withUsername(email);
            userBuilder.disabled(false);
            userBuilder.password(user.getPassword());
            List<Authority> list = userServiceInter.authorities(user.getId());
            String[] authorities = new String[list.size()];
            for (int i = 0; i < list.size(); i++) {
                authorities[i] = list.get(i).getName();
            }

            userBuilder.authorities(authorities);
            return userBuilder.build();
        } else {
            throw new UsernameNotFoundException("User not found");
        }
    }

    public String getUserEmail() {
        return userEmail;
    }

}
