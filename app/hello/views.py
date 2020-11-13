from django.shortcuts import render


def hello(request):
    name = "jiro"
    return render(request, "hello.html", {"name": name})
