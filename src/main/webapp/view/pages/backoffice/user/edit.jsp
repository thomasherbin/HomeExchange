<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="EditUser" value="/editUser">
    <c:param name="id" value="${user.id}" />
</c:url>

<div class="container">
    <div class="container_small">
        <h1 class="text-center mt-2 mb-3">Edit User</h1>
        <springForm:form method="POST" modelAttribute="user" action="${EditUser}">
            <form>
                <div class="form-group row">
                    <label for="firstName" class="col-sm-3 col-form-label font-weight-bold">First Name</label>
                    <div class="col-sm-9">
                        <springForm:input path="firstName" value="${user.firstName}" type="text" class="form-control" id="firstName" placeholder="First Name"/>
                    </div>
                    <springForm:errors path="firstName"/>

                </div>
                <div class="form-group row">
                    <label for="lastName" class="col-sm-3 col-form-label font-weight-bold">Last Name</label>
                    <div class="col-sm-9">
                        <springForm:input path="lastName" value="${user.lastName}" type="text" class="form-control" id="lastName" placeholder="Last Name"/>
                    </div>
                    <springForm:errors path="lastName"  />
                </div>
                <div class="form-group row">
                    <label for="userName" class="col-sm-3 col-form-label font-weight-bold">Username</label>
                    <div class="col-sm-9">
                        <springForm:input path="userName" value="${user.userName}" type="text" class="form-control" id="userName" placeholder="Username"/>
                    </div>
                    <springForm:errors path="userName"  />
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-3 col-form-label font-weight-bold">Email</label>
                    <div class="col-sm-9">
                        <springForm:input path="email" value="${user.email}" type="text" class="form-control" id="email" placeholder="Email"/>
                    </div>
                    <springForm:errors path="email"  />
                </div>
                <div class="form-group row">
                    <label for="firstName" class="col-sm-3 col-form-label font-weight-bold">Role</label>
                    <div class="col-sm-9">
                        <springForm:select path="role">
                            <c:choose>
                                <c:when test="${userIsAdmin == true}">
                                    <springForm:option value="User" label="User"  />
                                    <springForm:option value="Admin" label="Admin" selected="true" />
                                </c:when>
                                <c:otherwise>
                                    <springForm:option value="User" label="User" selected="true" />
                                    <springForm:option value="Admin" label="Admin" />
                                </c:otherwise>
                            </c:choose>
                        </springForm:select>
                    </div>
                    <springForm:errors path="role"  />
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-3 col-form-label font-weight-bold">Password</label>
                    <div class="col-sm-9">
                        <springForm:input path="password" type="password" class="form-control" id="password" placeholder="Password"/>
                    </div>
                    <springForm:errors path="password"  />
                </div>
                <div class="form-group row">
                    <label for="passwordConfirm" class="col-sm-3 col-form-label font-weight-bold">Confirm your password</label>
                    <div class="col-sm-9">
                        <springForm:input path="passwordConfirm" type="password" class="form-control" id="passwordConfirm" placeholder="Confirm your password"/>
                    </div>
                    <springForm:errors path="passwordConfirm"  />
                </div>
                <input class="btn btn-outline-info" type="submit" value="Save User">
                <a class="btn btn-outline-info" href="/userList">Cancel</a>
            </form>
        </springForm:form>
    </div>
</div>
