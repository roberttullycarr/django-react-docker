from django.http import JsonResponse
from django.views import View

from todo.models import Todo


class GetAllTodosView(View):
    def get(self, request):
        todos = Todo.objects.all()
        response = [{'id': todo.id, 'description': todo.description} for todo in todos]
        return JsonResponse(response, safe=False)