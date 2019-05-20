<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <title><tiles:getAsString name="title" /></title>
</head>
<body>
<div>
    <div class="container" style="margin:50px">
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
    </div>
</div>
</body>
</html>