from django.shortcuts import render


def hello(request):
    name = "daisuke"
    return render(request, "hello.html", {"name": name})
