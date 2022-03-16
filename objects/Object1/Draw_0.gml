var results = video_draw();

if (results[0] == 0) {
    draw_surface(results[1], 0, 0);
}

if (video_get_status() == video_status_playing) {
    draw_text(32, 640, "Video status: playing");
    if (keyboard_check_pressed(vk_space)) {
        video_pause();
    }
} else if (video_get_status() == video_status_paused) {
    draw_text(32, 640, "Video status: paused");
    if (keyboard_check_pressed(vk_space)) {
        video_resume();
    }
}

if (video_get_format() == video_format_rgba) {
    draw_text(32, 672, "Video color format: RGBA");
} else if (video_get_format() == video_format_yuv) {
    draw_text(32, 672, "Video color format: YUV");
}

draw_text(32, 704, "Video position: " + string(floor(video_get_position() / 1000)) + "/" + string(floor(video_get_duration() / 1000)));
