from django.shortcuts import render


def hello(request):
    name = "sonoda"
    return render(request, "hello.html", {"name": name})
