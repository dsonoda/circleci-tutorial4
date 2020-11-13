from django.shortcuts import render


def hello(request):
    name = "taro"
    return render(request, "hello.html", {"name": name})
