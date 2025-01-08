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
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('name');
            $table->timestamp('due_date');
            $table->foreignId('asignee')->nullable()->references('id')->on('users');
            $table->text('priority');
            $table->text('status');
            $table->text('description');
            $table->foreignId('project_id')->constrained('projects');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
