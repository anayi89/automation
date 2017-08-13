from django.conf.urls import url
	from django.contrib. import admin
	from server import views

	urlpatterns = [
url(r‘^admin/’, admin.site.urls),
	# localhost/index
	url(r‘^[index]/’,
		views.[index]),
]
