package com.isep.HomeExchange.controller.Validator;

import com.isep.HomeExchange.model.service.UserService;
import com.isep.HomeExchange.model.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


@Component
public class UserChangePasswordValidator implements Validator {
    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "oldPassword", "NotEmpty");
        if (user.getOldPassword().length() < 8 || user.getOldPassword().length() > 32) {
            errors.rejectValue("oldPassword", "Size.userForm.password");
        }
        if (!passwordEncoder.matches(user.getOldPassword(), userService.getCurrentEncyptPassword())) {
            errors.rejectValue("oldPassword", "Diff.userForm.passwordOld");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }

}
