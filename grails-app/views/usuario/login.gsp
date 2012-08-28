<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<div class="body">
		<h1>Login</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="authenticate" method="post">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="email"><label for="email">Email:</label>
							</td>
							<td valign="top"><input type="text" id="email" name="email" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><label for="senha">Senha:</label>
							</td>
							<td valign="top"><input type="password" id="senha"
								name="senha" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"> <input type="submit" value="Login" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>