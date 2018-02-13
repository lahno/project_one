<?php

namespace App\Http\Controllers;

use App\Client;
use App\ClientOrder;
use App\Order;
use App\StatusOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use function Psy\debug;

class PostController extends Controller
{
    public function order(Request $request){

        Log::info('Отправка order: '.implode(", ", $request->all()));

        $services_name = DB::table('services')->pluck('id')->toArray();
        $messages = [
            'required'  => trans('main.required'),
            'string'    => trans('main.string'),
            'name.max'  => trans('main.name-max'),
            'name.min'  => trans('main.name-min'),
            'phone.max'  => trans('main.phone-max'),
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:55|min:3',
            'phone' => 'required|max:20',
            'service' => 'required|in:'.implode(",", $services_name)
        ], $messages);
        if ($validator->fails()) {
            $text_error = trans('main.error_1');
            $text_validator = $validator->errors();
            $errors = [];
            if ($text_validator->has('name')) {
                $errors = ['name' => $text_validator->first('name')];
            }
            if($text_validator->has('phone')){
                $errors += ['phone' => $text_validator->first('phone')];
            }
            if($text_validator->has('service')){
                $errors += ['service' => $text_validator->first('service')];
            }
            return ['text_error' => $text_error, 'errors' => $errors];
        };

        Log::info('Валидация успешна!');

        $data = $this->initOrder($request);

        Log::info('Запись успешна!');

        Mail::send(env('THEME').'.email.mail', [
            'name'      => $data['name'],
            'phone'      => $data['phone'],
            'service'   => $data['service'],
            'order_id'  => $data['order_id']
        ], function($message) use ($request)
        {
            $message->from(env('SITE_EMAIL'), 'Web-icon.com.ua');
            $message->to(env('ADMIN_EMAIL'))->subject('order');
        });

        Log::info('Отправка успешна!');

        return $data['text'];
    }

    public function contact(Request $request){

        Log::info('Отправка contact: '.implode(", ", $request->all()));

        $services_name = DB::table('services')->pluck('id')->toArray();
        $messages = [
            'required'  => trans('main.required'),
            'string'    => trans('main.string'),
            'name.max'  => trans('main.name-max'),
            'name.min'  => trans('main.name-min'),
            'email'     => trans('main.email'),
            'phone.max'  => trans('main.phone-max'),
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:55|min:3',
            'email' => 'required|email',
            'phone' => 'required|max:20',
            'text' => 'string|nullable',
            'service' => 'required|in:'.implode(",", $services_name).','.env('ID_TOPIC_OTHER')
        ], $messages);

        if ($validator->fails()) {
            $text_error = trans('main.error_1');
            $text_validator = $validator->errors();
            $errors = [];
            if ($text_validator->has('name')) {
                $errors = ['name' => $text_validator->first('name')];
            }
            if($text_validator->has('phone')){
                $errors += ['phone' => $text_validator->first('phone')];
            }
            if($text_validator->has('email')){
                $errors += ['email' => $text_validator->first('email')];
            }
            if($text_validator->has('text')){
                $errors += ['text' => $text_validator->first('text')];
            }
            if($text_validator->has('service')){
                $errors += ['service' => $text_validator->first('service')];
            }
            return ['text_error' => $text_error, 'errors' => $errors];
        };

        Log::info('Валидация успешна!');

        $data = $this->initOrder($request);

        Log::info('Запись успешна!');

        Mail::send(env('THEME').'.email.mail', [
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'service' => $data['service'],
            'text' => $request->text,
            'order_id' => $data['order_id']
        ], function($message) use ($request)
        {
            $message->from(env('SITE_EMAIL'), 'Web-icon.com.ua');
            $message->to(env('ADMIN_EMAIL'))->subject('order');
        });

        Mail::send(env('THEME').'.email.mail', [
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'service' => $data['service'],
            'text' => $request->text,
            'order_id' => $data['order_id']
        ], function($message) use ($request)
        {
            $message->from(env('SITE_EMAIL'), 'Web-icon.com.ua');
            $message->to($request->email)->subject('order');
        });

        Log::info('Отправка успешна!');
        return $data['text'];
    }

    public function service(Request $request){

        Log::info('Отправка service: '.implode(", ", $request->all()));

        $services_name = DB::table('services')->pluck('id')->toArray();
        $messages = [
            'required'  => trans('main.required'),
            'string'    => trans('main.string'),
            'name.max'  => trans('main.name-max'),
            'name.min'  => trans('main.name-min'),
            'email'     => trans('main.email'),
            'phone.max'  => trans('main.phone-max'),
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:55|min:3',
            'email' => 'required|email',
            'phone' => 'required|max:20',
            'text' => 'string|nullable',
            'service' => 'required|in:'.implode(",", $services_name).','.env('ID_TOPIC_OTHER')
        ], $messages);

        if ($validator->fails()) {
            $text_error = trans('main.error_1');
            $text_validator = $validator->errors();
            $errors = [];
            if ($text_validator->has('name')) {
                $errors = ['name' => $text_validator->first('name')];
            }
            if($text_validator->has('phone')){
                $errors += ['phone' => $text_validator->first('phone')];
            }
            if($text_validator->has('email')){
                $errors += ['email' => $text_validator->first('email')];
            }
            if($text_validator->has('text')){
                $errors += ['text' => $text_validator->first('text')];
            }
            if($text_validator->has('service')){
                $errors += ['service' => $text_validator->first('service')];
            }
            return ['text_error' => $text_error, 'errors' => $errors];
        };

        Log::info('Валидация успешна!');

        $data = $this->initOrder($request);

        Log::info('Запись успешна!');

        Mail::send(env('THEME').'.email.mail', [
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'service' => $data['service'],
            'text' => $request->text,
            'order_id' => $data['order_id']
        ], function($message) use ($request)
        {
            $message->from(env('SITE_EMAIL'), 'Web-icon.com.ua');
            $message->to(env('ADMIN_EMAIL'))->subject('order');
        });

        Mail::send(env('THEME').'.email.mail', [
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'service' => $data['service'],
            'text' => $request->text,
            'order_id' => $data['order_id']
        ], function($message) use ($request)
        {
            $message->from(env('SITE_EMAIL'), 'Web-icon.com.ua');
            $message->to($request->email)->subject('order');
        });

        Log::info('Отправка успешна!');
        return $data['text'];
    }

    public function initOrder($request){
        $name = trim($request->name);
        $phone = preg_replace("/[^0-9]/", "", trim($request->phone));
        $array_phone = [
            $phone,
            '3'.$phone,
            '8'.$phone,
            '38'.$phone,
            '7'.$phone,
            '375'.$phone,
        ];
        $email = false;
        if (isset($request->email)){
            $email = trim($request->email);
            $client_id = DB::table('clients')->whereIn('phone', $array_phone)->orWhere('email', $email)->find(1);
//            Log::info('client-name: '.$client_id->name);
//            Log::info('client-email: '.$client_id->email);
//            Log::info('client-phone: '.$client_id->phone);
        }else{
            $client_id = DB::table('clients')->whereIn('phone', $array_phone)->first();
            if ($client_id){
//                Log::info('client-name: '.$client_id->name);
//                Log::info('client-email: '.$client_id->email);
//                Log::info('client-phone: '.$client_id->phone);
            }else{
                Log::info('Такого клиента нет в базе');
            }
        }

        Log::info('Почта: '.$email);

        if($request->service == env('ID_TOPIC_OTHER')){
            $service = trans('main.other');
            $order_id = false;
            if(!boolval($client_id)){
                //Новый клиент, записываем карточку клиента
                $client = $this->insClient($name, $phone, $email);
            }else{
                //Постоянный клиент, обновляем карточку клиента
                $client = $this->insClient($name, $phone, $email, $client_id);
            }
            $text = [trans('main.thanks_1'), trans('main.thanks_1_3')];
        }else{
            $service = DB::table('services')
                ->where('id', $request->service)
                ->value((LaravelLocalization::getCurrentLocale() == 'ru')?'name':'name_en');

            //Записываем заказ
            //TODO - два параметра не всегда могут быть
            if(isset($request->text) && isset($email)){
                $order = $this->insOrder($name, $phone, $request->service, $email, $request->text);
            }elseif(isset($request->text)){
                $order = $this->insOrder($name, $phone, $request->service, false, $request->text);
            }elseif(isset($email)){
                $order = $this->insOrder($name, $phone, $request->service, $email);
            }else{
                $order = $this->insOrder($name, $phone, $request->service);
            }

            $order_id = $order->id;

            if(!boolval($client_id)){
                //Новый клиент, записываем карточку клиента
                $client = $this->insClient($name, $phone, $email);

                //Записываем связь
                $client_order = $this->insClientOrder($client, $order);
            }else{
                //Постоянный клиент, обновляем карточку клиента
                $client = $this->insClient($name, $phone, $email, $client_id);

                //Записываем связь
                $client_order = $this->insClientOrder($client_id, $order);
            }

            if ($request->email){
                $text = [trans('main.thanks_1'), trans('main.thanks_1_3')];
            }else{
                $text = [trans('main.thanks_1'), trans('main.thanks_1_2')];
            }
        }

        return [
            'text' => $text,
            'name' => $name,
            'email' => $email,
            'phone' => $phone,
            'service' => $service,
            'order_id' => $order_id
        ];
    }

    public function insOrder($name, $phone, $service, $email = null, $text = null){
        $order = new Order();
        $order->name = $name . ' - ' . $phone;
        $order->phone = $phone;
        $order->service_id = $service;
        $order->status_id = 1;
        if($email){
            $order->email = $email;
        }
        if($text){
            $order->comment = $text;
        }
        $order->code = $this->str_random(12);
        $order->save();
        return $order;
    }

    public function insClient($name, $phone, $email = null, $client_id = null){

        if(isset($client_id)){
            $client = Client::where('id', $client_id->id)->first();
            if (!isset($client_id->name)){
                $client->name = $name;
                $client->save();
            }
            if (!isset($client_id->email)){
                $client->email = $email;
                $client->save();
            }
            if (!isset($client_id->phone)){
                $client->phone = $phone;
                $client->save();
            }
        }else{
            $client = new Client();
            $client->name = $name;
            $client->phone = $phone;
            if ($email){
                $client->email = $email;
            }
            $client->save();
        }

        return $client;
    }

    public function insClientOrder($client, $order){
        $client_order = new ClientOrder();
        $client_order->client_id = $client->id;
        $client_order->order_id = $order->id;
        $client_order->save();
        return $client_order;
    }

    public function str_random($length)
    {
        $string = '';
        while (($len = strlen($string)) < $length) {
            $size = $length - $len;
            $bytes = random_bytes($size);
            $string .= substr(str_replace(['/', '+', '='], '', base64_encode($bytes)), 0, $size);
        }
        return $string;
    }
}
