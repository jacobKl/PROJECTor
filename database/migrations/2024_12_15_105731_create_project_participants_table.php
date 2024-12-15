<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('project_participants', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer("user_id");
            $table->integer("project_id");
            $table->text("status");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_participants');
    }
};
