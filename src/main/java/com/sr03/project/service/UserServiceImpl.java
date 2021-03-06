package com.sr03.project.service;

import com.sr03.project.model.Role;
import com.sr03.project.model.User;
import com.sr03.project.repository.RoleRepository;
import com.sr03.project.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {

        if (user.getId() == null) {
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            HashSet<Role> roles = new HashSet<Role>();
            roles.add(roleRepository.findOne((long)2));
            user.setRoles(roles);
            user.setValid(true);
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            user.setCreationDate(timestamp);
        }

        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByMail(String mail) {
        return userRepository.findByMail(mail);
    }
    @Override
    public User findById(Long id) {
        return userRepository.findById(id);
    }
}
