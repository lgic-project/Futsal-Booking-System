<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\BaseController;
use App\Models\Venue;

class VenueController extends  BaseController
{

    public function allVenue()
    {
        try {
            $venue = Venue::all();
            return response()->json([
                'status' => true,
                'data' => ['venues' => $venue]
            ], 201);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }
}