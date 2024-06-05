diff --git a/src/Effect.cpp b/src/Effect.cpp
index 6bfa29d..7f0c20e 100644
--- a/src/Effect.cpp
+++ b/src/Effect.cpp
@@ -162,7 +162,6 @@ void ShapeCorners::Effect::prePaintWindow(KWin::EffectWindow *w, KWin::WindowPre
         reg += QRect(geo.x() + geo.width() - size, geo.y() + geo.height() - size, size, size);
         data.opaque -= reg;
         data.paint += reg;
-        data.setTranslucent();
     }
 
     OffscreenEffect::prePaintWindow(w, data, time);
