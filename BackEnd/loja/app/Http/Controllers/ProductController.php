<?php

namespace App\Http\Controllers ;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    // Cadastro de produtos
    public function create(Request $request)
    {
        $product = new Product($request->all());

        if ($product->save() === true) {
            return response()->json($product, 201);
        }
        return response()->json(["error" => "Erro ao cadastrar"], 400);
    }

    // Buscar um produto 
    public function searchProduct(int $id)
    {
        $product = Product::find($id);
        return response()->json($product);
    }

    // Buscar todos os produtos
    public function getAll(Request $request)
    {
        $busca = $request->input('search');
        $order = $request->input('order');

        if ($busca) {
            $products = Product::where('title', 'like', "%$busca%")
                               ->orWhere('description', 'like', "%$busca%")                               
                               ->orWhere('category', 'like', "%$busca%")                               
                               ;
        } else {
            // Faz o mesmo que Product::all() porém não traz ainda os resultados
            $products = Product::where(1, '=', 1);
        }

        if ($order) {  
            // Desestruturação usando list()
            [$campo, $ordenacao] = explode(':', $order);
            $products->orderBy($campo, $ordenacao);
        }

        return response()->json($products->get());
    }

    // Atualizar produto
    public function update(int $id, Request $request)
    {
    
        $product = Product::findOrFail($id);

        // Preenchendo o que veio da request no produto selecionado pelo ID
        $product->fill($request->all());

        if ($product->save()) {
            return response()->json($product, 202);
        }
        return response('Erro ao atualizar', 400);
    }

    // Excluir um produto
    public function delete(int $id)
    {
        $product = Product::findOrFail($id);
        if ($product->delete()) {
            return response()->json([
                'id' => $product->id,
                'mensagem' => 'Produto excluido' 
            ], 202);
        }
        return response('Erro ao excluir', 400);
    }

    // Upload de imagem produto 
    public function uploadimage(Request $request)
    {
        // Para encontrar a imagem rodar o comando: php artisan storage:link
        
        // Se encontrar um arquivo no campo image
        if ($request->hasFile('image')) {
            // Verificar qual a extensão do arquivo da imagem
            $extensao = $request->file('image')->extension();
            
            // StorePubliclyAs armazena o arquivo temporario na pasta informada
            $nomeArquivo = uniqid();
            $path = $request->file('image')->storePubliclyAs('public/products', "$nomeArquivo." . $extensao);

            // Resposta com um link 
            return response()->json([
                'url' => Storage::url($path)
            ]);
        }

        return response('Erro ao salvar a imagem', 400);
    }
}
