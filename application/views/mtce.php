<table class='table'>
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
	</tr>
	{items}
	<tr>
		<th><a class="btn btn-default" role="button" href="crud/edit/{id}">{id}</a></th>
		<th>{name}</th>
		<th>{description}</th>
	</tr>
	{/items}
</table>