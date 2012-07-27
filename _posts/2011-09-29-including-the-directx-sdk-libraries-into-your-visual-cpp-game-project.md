---
comments: true
date: 2011-09-29 15:00:55
layout: post
slug: including-the-directx-sdk-libraries-into-your-visual-cpp-game-project
title: Including the DirectX SDK libraries into your Visual C++ game project
wordpress_id: 1149
categories:
- C / C++
- Programming
tags:
- c#
- directx
- game programming
- sdk
- visual studio
---

If you are new to DirectX game programming, you might have come across this pitfall:



You added the DirectX header to your main file and it didn't compile because the files couldn't be found.

    
    #include <d3d11.h>
    #include <d3dx11.h>
    #include <d3dx10.h>





Fortunately, solving this problem is relatively straightforward.



## Downloading the DirectX SDK


You will need the DirectX SDK Libraries from Microsoft. These contain the aforementioned header files and libraries. Download the latest DirectX SDK from [here](http://msdn.microsoft.com/en-us/directx/aa937788).
When the download is complete, proceed by installing the DirectX SDK. Make sure you remember the installation location as you will need this later.


## Installing the DirectX SDK


[caption id="attachment_1150" align="aligncenter" width="513" caption="Installing DirectX"][![Installing DirectX](http://wpimages.phansch.de/2011/09/installation.png)](http://wpimages.phansch.de/2011/09/installation.png)[/caption]


## Add references to your project settings


[caption id="attachment_1153" align="aligncenter" width="300" caption="Adding the include path"][![Adding the include path](http://wpimages.phansch.de/2011/09/include_path-300x212.png)](http://wpimages.phansch.de/2011/09/include_path.png)[/caption]

In order to tell Visual Studio that your game requires DirectX, you will have to add the DirectX libraries and header files to your project.




	
  1. Open your project setting

	
  2. Navigate to _VC++ Directories_

	
  3. On the right, select _Includepaths_

	
  4. A new window will open, that lets you new include paths. Add a new include path by hitting the _New Row_ button in the top right.

	
  5. Now you will have to navigate to your DirectX SDK installation directory and select the Include folder.


[caption id="attachment_1183" align="aligncenter" width="300" caption="Include path"][![Include path](http://wpimages.phansch.de/2011/09/include_path2-300x199.png)](http://wpimages.phansch.de/2011/09/include_path2.png)[/caption]
Do the same for the library path and you project should compile properly.
