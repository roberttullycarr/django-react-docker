from django.db import models


class Todo(models.Model):
    description = models.CharField(max_length=150)

    def __str__(self):
        return self.description