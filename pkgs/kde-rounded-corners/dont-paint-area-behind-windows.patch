diff --git a/src/ShapeCornersEffect.cpp b/src/ShapeCornersEffect.cpp
index 08a4154..27a3f13 100644
--- a/src/ShapeCornersEffect.cpp
+++ b/src/ShapeCornersEffect.cpp
@@ -163,7 +163,6 @@ void ShapeCornersEffect::prePaintWindow(KWin::EffectWindow *w, KWin::WindowPrePa
         reg += QRect(geo.x() + geo.width() - size, geo.y() + geo.height() - size, size, size);
         data.opaque -= reg;
         data.paint += reg;
-        data.setTranslucent();
     }
 
     OffscreenEffect::prePaintWindow(w, data, time);
