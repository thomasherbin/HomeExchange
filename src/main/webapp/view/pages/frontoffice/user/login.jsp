<div class="container">
    <form method="POST" action="${contextPath}/login" class="form-signin ml-5 pl-3" style="width: 90%">
        <h2 class="form-heading text-center pb-3 mt-3">Log in</h2>
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username" autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="text-center pt-2 pb-2">
                <button class="btn btn-outline-info" type="submit">Log In</button>
            </div>
            <h4 class="text-center"><a class="btn btn-outline-info" href="${contextPath}/registration">Create an account</a></h4>
        </div>
    </form>
</div>