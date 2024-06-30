<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\BaseModel;

class BaseController extends Controller
{
    protected $title = "";
    protected $subTitle = "";
    protected $route = "";
    protected $icon = "flaticon2-user";
    protected $resources = "admin::users.";
    protected $success = ['status' => true];
    protected $error = ['status' => false];

    public function __construct()
    {
        if ($this->title) {
            $this->route = strtolower($this->title) . ".";
        }
    }


    function createResource()
    {
        return $this->resources . 'create';
    }

    function indexResource()
    {
        return $this->resources . 'index';
    }

    function editResource()
    {
        return $this->resources . 'edit';
    }

    function showResource()
    {
        return $this->resources . 'show';
    }


    function indexRoute()
    {
        return $this->route . 'index';
    }

    function showRoute()
    {
        return $this->route . 'show';
    }


    function gotoCrudIndex()
    {
        return redirect()->route($this->route . 'index');
    }


    function crudInfo()
    {
        $data['title'] = $this->title;
        $data['subTitle'] = $this->subTitle;
        $data['route'] = $this->route;
        $data['icon'] = $this->icon;
        $data['item'] = new BaseModel();
        return $data;
    }

    /**
     * success response method.
     *
     * @param $result
     * @param $message
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result, $message)
    {
        $response = [
            'status' => true,
            'data'    => $result,
            'message' => $message,
        ];


        return response()->json($response, 200);
    }

    /**
     * return error response.
     *
     * @param $error
     * @param  array  $errorMessages
     * @param  int  $code
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error, $errorMessages = [], $code = 404)
    {
        $response = [
            'status' => false,
            'message' => $error,
        ];


        if (!empty($errorMessages)) {
            $response['data'] = $errorMessages;
        }


        return response()->json($response, $code);
    }
}