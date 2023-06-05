#version 460 core  //GLSLの版指定

#include <flutter/runtime_effect.glsl>  //Flutter固有のヘルパー

uniform vec2 uSize;     //入力値 vector2
uniform vec4 uColor;    //入力値 vector4

out vec4 fragColor;     //出力 vector4

void main() {
    vec2 pixel = FlutterFragCoord() / uSize;
    vec4 white = vec4(1.0);
    vec4 colorWithAlpha = vec4(uColor.rgb * uColor.a, uColor.a);
    fragColor = mix(colorWithAlpha, white, pixel.x);
}