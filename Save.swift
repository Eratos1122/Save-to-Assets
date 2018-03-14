{\rtf1\ansi\ansicpg1252\cocoartf1561
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red178\green24\blue137;\red30\green32\blue40;\red255\green255\blue255;
\red0\green160\blue190;\red131\green192\blue87;\red65\green182\blue69;}
{\*\expandedcolortbl;;\csgenericrgb\c69800\c9500\c53600;\csgenericrgb\c11800\c12500\c15700;\csgenericrgb\c100000\c100000\c100000;
\csgenericrgb\c0\c62600\c74600;\csgenericrgb\c51200\c75400\c34300;\csgenericrgb\c25500\c71400\c27000;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab543
\pard\tx543\pardeftab543\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \cb3 func\cf4  saveImage(image: \cf5 UIImage\cf4 , completion: \cf2 @escaping\cf4  (\cf2 _\cf4  success: \cf5 Bool\cf4 ) -> ()) \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4         
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf2 if\cf4  \cf6 assetCollection\cf4  == \cf2 nil\cf4  \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 return\cf4    \cf7 // If there was an error upstream, skip the save.
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4         
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf5 PHPhotoLibrary\cf4 .\cf5 shared\cf4 ().\cf5 performChanges\cf4 (\{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 let\cf4  assetChangeRequest = \cf5 PHAssetChangeRequest\cf4 .\cf5 creationRequestForAsset\cf4 (from: image)
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 _\cf4  = assetChangeRequest.\cf5 placeholderForCreatedAsset
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 _\cf4  = \cf5 PHAssetCollectionChangeRequest\cf4 .\cf2 init\cf4 (for: \cf2 self\cf4 .\cf6 assetCollection\cf4 )
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}, completionHandler: \{ (success, error) \cf2 in
\f1\fs24 \cf0 \

\f0\fs22 \cf4             completion(success)
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \})
\f1\fs24 \cf0 \

\f0\fs22 \cf4     \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4     
\f1\fs24 \cf0 \

\f0\fs22 \cf4     \cf2 func\cf4  saveGif(data: \cf5 Data\cf4 , completion: \cf2 @escaping\cf4  (\cf2 _\cf4  success: \cf5 Bool\cf4 ) -> ()) \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4         
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf2 if\cf4  \cf6 assetCollection\cf4  == \cf2 nil\cf4  \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 return\cf4    \cf7 // If there was an error upstream, skip the save.
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf5 PHPhotoLibrary\cf4 .\cf5 shared\cf4 ().\cf5 performChanges\cf4 (\{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf5 PHAssetCreationRequest\cf4 .\cf5 forAsset\cf4 ().\cf5 addResource\cf4 (with: .\cf5 photo\cf4 , data: data, options: \cf2 nil\cf4 )
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}) \{ (success, error) \cf2 in
\f1\fs24 \cf0 \

\f0\fs22 \cf4             completion(success)
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4     \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4     
\f1\fs24 \cf0 \

\f0\fs22 \cf4     \cf2 func\cf4  saveVideo(url: \cf5 URL\cf4 , completion: \cf2 @escaping\cf4  (\cf2 _\cf4  success: \cf5 Bool\cf4 ) -> ()) \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4         
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf2 if\cf4  \cf6 assetCollection\cf4  == \cf2 nil\cf4  \{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 return\cf4    \cf7 // If there was an error upstream, skip the save.
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \cf5 PHPhotoLibrary\cf4 .\cf5 shared\cf4 ().\cf5 performChanges\cf4 (\{
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 let\cf4  assetChangeRequest = \cf5 PHAssetChangeRequest\cf4 .\cf5 creationRequestForAssetFromVideo\cf4 (atFileURL: url)
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 _\cf4  = assetChangeRequest?.\cf5 placeholderForCreatedAsset
\f1\fs24 \cf0 \

\f0\fs22 \cf4             \cf2 _\cf4  = \cf5 PHAssetCollectionChangeRequest\cf4 .\cf2 init\cf4 (for: \cf2 self\cf4 .\cf6 assetCollection\cf4 )
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \}, completionHandler: \{ (success, error) \cf2 in
\f1\fs24 \cf0 \

\f0\fs22 \cf4             completion(success)
\f1\fs24 \cf0 \

\f0\fs22 \cf4         \})
\f1\fs24 \cf0 \

\f0\fs22 \cf4     \}}