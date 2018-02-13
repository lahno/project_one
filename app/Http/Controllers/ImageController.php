<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\URL;

class ImageController extends Controller
{
    /**
     * Method to upload and save images
     * @param Request $request
     * @return mixed
     */
    public function storeAdmin(Request $request)
    {
        $file = $request->file('upload');
        $file_name = uniqid().'.' . $request->upload->getClientOriginalExtension();
        $data = [
            'url_image' => url('/images_admin/article_img').'/'.$file_name
        ];
        $file->move(public_path().'/images_admin/article_img/', $data['url_image']);

        $url_image = '/images_admin/article_img/'.$file_name;
        $path_to_image = '';

        $result = ["uploaded" => 1, 'url' => $url_image, 'fileName' => $file_name];

        if ($request->CKEditorFuncNum && $request->CKEditor && $request->langCode) {
            //that handler to upload image CKEditor from Dialog
            $funcNum = $request->CKEditorFuncNum;
            $CKEditor = $request->CKEditor;
            $langCode = $request->langCode;
            $token = $request->ckCsrfToken;
            return view('helper.ckeditor.upload_file', compact('result', 'funcNum', 'CKEditor', 'langCode', 'token'));
        }

        return $result;
    }
}