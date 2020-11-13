from django.shortcuts import render


def hello(request):
    name = "saburo"
    return render(request, "hello.html", {"name": name})
