from django.shortcuts import render, redirect
from .models import Item

def item_list(request):
    items = Item.objects.all()
    return render(request, 'item_list.html', {'items': items})


def add_item(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')

        # Boş olmayan alanları kontrol et
        if name and price:
            Item.objects.create(
                name=name,
                description=description,
                price=price
            )
            return redirect('item_list')  # Liste sayfasına yönlendir
        else:
            error_message = "Name and price fields are required."

            # Hata mesajıyla sayfayı tekrar yükle
            return render(request, 'add_item.html', {'error_message': error_message})

    return render(request, 'add_item.html')