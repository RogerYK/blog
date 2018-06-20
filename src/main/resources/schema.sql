DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `html_content` text,
  `img_link` varchar(255) DEFAULT NULL,
  `md_content` text,
  `show_count` tinyint(4) DEFAULT '0',
  `summary` text,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author_username` varchar(10) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5we9qk2g9491lehcssvpikswy` (`author_username`),
  KEY `FKy5kkohbk00g0w88fi05k2hcw` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2018-06-18 11:48:16','<p>virtualenv 是用来创建 Python 的虚拟环境的库，虚拟环境能够独立于真实环境存在，并且可以同时有多个互相独立的 Python 虚拟环境，每个虚拟环境都可以营造一个干净的开发环境，对于项目的依赖、版本的控制有着非常重要的作用。<br>虚拟环境有什么意义？打个比喻，现在有一个 Django 项目，使用的 Django 版本是1.8，但是系统的 Django 版本已经是更加新的1.11，如果使用系统的环境来运行项目，可能导致很多不兼容，于是，这个问题就可以使用一个虚拟环境来解决，使用 virtualenv 来创建一个只给这个项目运行的开发环境，既可以保证项目的正常运行，也方便了之后移植项目。  </p><h2 id=\"h2-virtualenv-\"><a name=\"virtualenv 的安装和使用\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>virtualenv 的安装和使用</h2><p>由于 virtualenv 在 Windows 和 linux 上的安装和使用有一点点不同，所以需要分别来讲。  </p><h3 id=\"h3--virtualenv\"><a name=\"安装 virtualenv\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装 virtualenv</h3><p>virtualenv 的安装在 Windows 和 linux 上面是一样的，所以不分开讲解。安装 virtualenv 跟安装一般的 Python 库是一样的操作，直接使用 pip 命令就行了：  </p><pre><code>pip install virtualenv</code></pre><p>安装完成之后就可以使用 virtualenv 的命令来创建虚拟环境了，首先需要在 cmd 命令中进入需要创建虚拟环境的文件夹，比如 F 盘的 envs 文件夹，然后使用以下命令创建一个虚拟环境，暂且取名为 new_env：  </p><pre><code>virtualenv new_env</code></pre><p>可以看到类似如下的结果：  </p><pre><code>F:\\envs&gt;virtualenv new_envUsing base prefix &#39;f:\\\\python352&#39;New python executable in F:\\envs\\new_env\\Scripts\\python.exeInstalling setuptools, pip, wheel...done.</code></pre><p>上面这段返回的意思是使用当前系统的 Python 版本创建一个虚拟环境  </p><h3 id=\"h3--virtualenv\"><a name=\"使用 virtualenv\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用 virtualenv</h3><ul><li>在Windows上使用virtualenv<br>首先进入到虚拟环境目录中的 Scripts 目录：  <pre><code>F:\\envs&gt;cd new_env\\Scripts</code></pre>然后输入activate就可以了，会出现如下的结果：<pre><code>(new_env) F:\\envs\\new_env\\Scripts&gt;</code></pre>在地址的前面出现了一个括号和虚拟环境的名称，这个就表示现在已经在虚拟环境 new_env 中了，之后的所有操作都是在虚拟环境中进行的，直接输入python可以查看当前环境下的 Python 版本，可以得到如下输出:  <pre><code>(new_env) F:\\envs\\new_env\\Scripts&gt;pythonPython 3.5.2 (v3.5.2:4def2a2901a5, Jun 25 2016, 22&#58;18&#58;55) [MSC v.1900 64 bit (AMD64)] on win32Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license&quot; for more information.&gt;&gt;&gt;</code></pre>使用pip的list命令可以查看当前环境下的所有包含的库的版本：  <pre><code>(new_env) F:\\envs\\new_env\\Scripts&gt;pip listDEPRECATION: The default format will switch to columns in the future. You can use --format=(legacy|columns) (or define a format=(legacy|columns) in your pip.conf under the [list] section) to disable this warning.pip (9.0.1)setuptools (38.5.2)wheel (0.30.0)</code></pre></li><li>在 Linux 上使用 virtualenv<br>Linux 上面进入虚拟环境的方式跟 Windows 稍微有点不同，可以直接使用命令来进入，比如同样在 Linux 上面的 envs 文件夹下面有个 new_env 虚拟环境，则直接输入以下命令就可以进入虚拟环境：  <pre><code>$ source new_env/bin/activate</code></pre>同样可以看到类似如下的结果:<pre><code>(new_env) alex<a href=\"https://github.com/VirtualBox\" title=\"&#64;VirtualBox\" class=\"at-link\">@VirtualBox</a>:~/www/envs$</code></pre>进入了虚拟环境之后，Windows 和 Linux 上面的操作都是一样的，这里就不单独去说明了。  </li></ul>','/imgs/env.png','virtualenv 是用来创建 Python 的虚拟环境的库，虚拟环境能够独立于真实环境存在，并且可以同时有多个互相独立的 Python 虚拟环境，每个虚拟环境都可以营造一个干净的开发环境，对于项目的依赖、版本的控制有着非常重要的作用。  虚拟环境有什么意义？打个比喻，现在有一个 Django 项目，使用的 Django 版本是1.8，但是系统的 Django 版本已经是更加新的1.11，如果使用系统的环境来运行项目，可能导致很多不兼容，于是，这个问题就可以使用一个虚拟环境来解决，使用 virtualenv 来创建一个只给这个项目运行的开发环境，既可以保证项目的正常运行，也方便了之后移植项目。  ## virtualenv 的安装和使用由于 virtualenv 在 Windows 和 linux 上的安装和使用有一点点不同，所以需要分别来讲。  ### 安装 virtualenvvirtualenv 的安装在 Windows 和 linux 上面是一样的，所以不分开讲解。安装 virtualenv 跟安装一般的 Python 库是一样的操作，直接使用 pip 命令就行了：  ```pip install virtualenv```安装完成之后就可以使用 virtualenv 的命令来创建虚拟环境了，首先需要在 cmd 命令中进入需要创建虚拟环境的文件夹，比如 F 盘的 envs 文件夹，然后使用以下命令创建一个虚拟环境，暂且取名为 new_env：  ```virtualenv new_env```可以看到类似如下的结果：  ```F:\\envs>virtualenv new_envUsing base prefix \'f:\\\\python352\'New python executable in F:\\envs\\new_env\\Scripts\\python.exeInstalling setuptools, pip, wheel...done.```上面这段返回的意思是使用当前系统的 Python 版本创建一个虚拟环境  ### 使用 virtualenv* 在Windows上使用virtualenv  首先进入到虚拟环境目录中的 Scripts 目录：  ```F:\\envs>cd new_env\\Scripts```然后输入activate就可以了，会出现如下的结果：```(new_env) F:\\envs\\new_env\\Scripts>```在地址的前面出现了一个括号和虚拟环境的名称，这个就表示现在已经在虚拟环境 new_env 中了，之后的所有操作都是在虚拟环境中进行的，直接输入python可以查看当前环境下的 Python 版本，可以得到如下输出:  ```(new_env) F:\\envs\\new_env\\Scripts>pythonPython 3.5.2 (v3.5.2:4def2a2901a5, Jun 25 2016, 22:18:55) [MSC v.1900 64 bit (AMD64)] on win32Type \"help\", \"copyright\", \"credits\" or \"license\" for more information.>>>```使用pip的list命令可以查看当前环境下的所有包含的库的版本：  ```(new_env) F:\\envs\\new_env\\Scripts>pip listDEPRECATION: The default format will switch to columns in the future. You can use --format=(legacy|columns) (or define a format=(legacy|columns) in your pip.conf under the [list] section) to disable this warning.pip (9.0.1)setuptools (38.5.2)wheel (0.30.0)```* 在 Linux 上使用 virtualenv   Linux 上面进入虚拟环境的方式跟 Windows 稍微有点不同，可以直接使用命令来进入，比如同样在 Linux 上面的 envs 文件夹下面有个 new_env 虚拟环境，则直接输入以下命令就可以进入虚拟环境：  ```$ source new_env/bin/activate```同样可以看到类似如下的结果:```(new_env) alex@VirtualBox:~/www/envs$ ```进入了虚拟环境之后，Windows 和 Linux 上面的操作都是一样的，这里就不单独去说明了。  ',24,'virtualenv 是用来创建 Python 的虚拟环境的库，虚拟环境能够独立于真实环境存在，并且可以同时有多个互相独立的 Python 虚拟环境，每个虚拟环境都可以营造一个干净的开发环境，对于项目的依赖、版本的控制有着非常重要的作用。','Python 虚拟环境 Virtualenv 分别在 Windows 和 Linux 上的安装和使用','2018-06-20 17:18:22','Roger',2),(14,'2018-06-19 23:25:07','<p>我的 Django 项目做了一次实际的项目移植，就是把同一个项目连同数据库中存储的信息迁移到另外一个环境中。具体是把服务器上面的数据库迁移到了本地，也就是 Linux 服务器到本地 Windows，这篇文章就来简述一下我具体的操作过程。  </p><h2 id=\"h2-django-\"><a name=\"Django 项目文件的迁移\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Django 项目文件的迁移</h2><p>关于项目文件的迁移没必要做过多的说明，因为一般这种操作都是依靠 Github 去克隆或者 pull 就行了，对应我这个博客项目，完整的操作可以查看我的 Github 的 博客项目介绍。  </p><h2 id=\"h2-mysql-\"><a name=\"MySQL 数据库的迁移\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>MySQL 数据库的迁移</h2><p>因为我的博客使用的数据库是 MySQL，所以这里主要还是说一下这个数据库的说明。</p><p>首先，需要强调的我的数据库使用的编码格式是 utf8mb4，这是为了使博客支持 emoji 表情的编码，我当时创建数据库的语句是下面这句：  </p><pre><code>CREATE DATABASE `izone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;</code></pre><h3 id=\"h3-u5BFCu51FAu6570u636Eu5E93\"><a name=\"导出数据库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导出数据库</h3><p>首先，需要在服务器上面把已经存了很多信息的数据库导出来，方法很简单，但是我还是在这里遇到了坑（其实是个笑话，我对 mysql 用的不多，都是需要用的时候去查，或者用的 Python 操作的数据库），具体的就是本来导出数据库文件的命令应该是在命令行中运行，我一开始一直以为这个导出的语句是在进入了 mysql 之后运行的 mysql 语句，所以一直搞错了，后来才知道导出数据的命令是系统命令。</p><p>具体的做法应该是这样：  </p><ul><li>首先，进入一个需要保存导出的文件的文件夹中，比如我创建的 dbs 文件夹  </li><li>然后使用下面命令即可：<pre><code>mysqldump -uroot -p izone &gt; izone.sql</code></pre>这个命令运行会让你输入 root 用户的密码，当然你也可以使用其他用户，千万注意，这个命令是系统命令，不用进入 mysql 的 shell 中运行  </li><li>上面命令运行完毕，可以看到 dbs 文件夹下面多了一个 izone.sql 文件，这个就是导出的数据库。</li><li>将数据库导出的文件传递到本地，因为我服务器和本地的连接使用的工具是 Xshell 5，所以我只说这个工具的方式。首先需要下载一个文件传输的工具，名字是 Xftp 5,下载安装时候再使用 Xshell 5上面的“新建文件传输”就可以直接把服务器的文件拉到本地，非常方便。<h3 id=\"h3-u65B0u5EFAu6570u636Eu5E93\"><a name=\"新建数据库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>新建数据库</h3>在本地新建一个数据库，使用的命令可以跟之前在服务器上面的建的一样：  <pre><code>CREATE DATABASE `izone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;</code></pre><h3 id=\"h3-u5BFCu5165u6570u636Eu5E93u6587u4EF6\"><a name=\"导入数据库文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导入数据库文件</h3>本地数据库已经建好了之后，进入本地放有从服务器传过来数据文件的文件夹，启动 cmd 命令窗口。  </li></ul><p>在当前文件夹下运行系统命令：</p><pre><code>mysql -uroot -p -D izone &lt; izone.sq</code></pre><p>结果会发现运行报错了，具体的报错信息大致应该如下：</p><pre><code>ERROR at line 191: Unkown command &#39;\\&#39;&#39;</code></pre><p>后来我查了，这个报错是因为编码的问题，当然，我其实也不太理解为什么要报错，因为我在建数据的时候明明已经设置了数据库的编码了，不过无所谓，反正有解决的方法就行，具体的方法就是把命令加一句改成这样：  </p><pre><code>mysql -uroot -p -D izone --default-character=utf8mb4 &lt; izone.sql</code></pre><p>上面的命令运行完毕如果没有报错，那就已经导入了数据库了，可以自己进入 mysql 中查看，这里不做查询的说明。  </p><h2 id=\"h2-django-\"><a name=\"Django 文件的迁移\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Django 文件的迁移</h2><p>当数据库已经准备好了，就可以开始进行数据的迁移了，因为我本地本来是运行过项目的，所以在项目的每个应用下面都已经生产过数据迁移的文件，所以现在要按照之前关于数据迁移的操作来进行操作了。</p><ul><li>第一步是将所有应用下面的迁移文件全部删除，只保留 <strong>init</strong>.py 文件即可</li><li>第二步是按照应用依赖的顺序去创建迁移命令，即依次执行下面的四句命令<pre><code>python manage.py makemigrations oauthpython manage.py makemigrations blogpython manage.py makemigrations commentpython manage.py makemigrations tool</code></pre>最后执行：  <pre><code>python manage.py migrate</code></pre>上面的命令全部执行完毕，如果不报错，那么关于项目的数据库迁移就结束了，可以开始运行项目了，可以发现服务器上面保存的信息已经全部移植到了本地。  </li></ul><p>不过，由于我的博客项目中的用户系统中应用了第三方账号登录，而第三方账号登录使用的是 Oauth 协议，这个就决定了第三方账号的登录是跟域名绑定的，所以在本地已经不能使用第三方账号登录了，而自带的用户系统的账号还是可以登录的。</p>','/imgs/database.png','我的 Django 项目做了一次实际的项目移植，就是把同一个项目连同数据库中存储的信息迁移到另外一个环境中。具体是把服务器上面的数据库迁移到了本地，也就是 Linux 服务器到本地 Windows，这篇文章就来简述一下我具体的操作过程。  ## Django 项目文件的迁移关于项目文件的迁移没必要做过多的说明，因为一般这种操作都是依靠 Github 去克隆或者 pull 就行了，对应我这个博客项目，完整的操作可以查看我的 Github 的 博客项目介绍。  ## MySQL 数据库的迁移因为我的博客使用的数据库是 MySQL，所以这里主要还是说一下这个数据库的说明。首先，需要强调的我的数据库使用的编码格式是 utf8mb4，这是为了使博客支持 emoji 表情的编码，我当时创建数据库的语句是下面这句：  ```CREATE DATABASE `izone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;```### 导出数据库首先，需要在服务器上面把已经存了很多信息的数据库导出来，方法很简单，但是我还是在这里遇到了坑（其实是个笑话，我对 mysql 用的不多，都是需要用的时候去查，或者用的 Python 操作的数据库），具体的就是本来导出数据库文件的命令应该是在命令行中运行，我一开始一直以为这个导出的语句是在进入了 mysql 之后运行的 mysql 语句，所以一直搞错了，后来才知道导出数据的命令是系统命令。具体的做法应该是这样：  * 首先，进入一个需要保存导出的文件的文件夹中，比如我创建的 dbs 文件夹  * 然后使用下面命令即可：```mysqldump -uroot -p izone > izone.sql```这个命令运行会让你输入 root 用户的密码，当然你也可以使用其他用户，千万注意，这个命令是系统命令，不用进入 mysql 的 shell 中运行  * 上面命令运行完毕，可以看到 dbs 文件夹下面多了一个 izone.sql 文件，这个就是导出的数据库。* 将数据库导出的文件传递到本地，因为我服务器和本地的连接使用的工具是 Xshell 5，所以我只说这个工具的方式。首先需要下载一个文件传输的工具，名字是 Xftp 5,下载安装时候再使用 Xshell 5上面的“新建文件传输”就可以直接把服务器的文件拉到本地，非常方便。### 新建数据库在本地新建一个数据库，使用的命令可以跟之前在服务器上面的建的一样：  ```CREATE DATABASE `izone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;```### 导入数据库文件本地数据库已经建好了之后，进入本地放有从服务器传过来数据文件的文件夹，启动 cmd 命令窗口。  在当前文件夹下运行系统命令：```mysql -uroot -p -D izone < izone.sq```结果会发现运行报错了，具体的报错信息大致应该如下：```ERROR at line 191: Unkown command \'\\\'\'```后来我查了，这个报错是因为编码的问题，当然，我其实也不太理解为什么要报错，因为我在建数据的时候明明已经设置了数据库的编码了，不过无所谓，反正有解决的方法就行，具体的方法就是把命令加一句改成这样：  ```mysql -uroot -p -D izone --default-character=utf8mb4 < izone.sql```上面的命令运行完毕如果没有报错，那就已经导入了数据库了，可以自己进入 mysql 中查看，这里不做查询的说明。  ## Django 文件的迁移当数据库已经准备好了，就可以开始进行数据的迁移了，因为我本地本来是运行过项目的，所以在项目的每个应用下面都已经生产过数据迁移的文件，所以现在要按照之前关于数据迁移的操作来进行操作了。* 第一步是将所有应用下面的迁移文件全部删除，只保留 __init__.py 文件即可* 第二步是按照应用依赖的顺序去创建迁移命令，即依次执行下面的四句命令```python manage.py makemigrations oauthpython manage.py makemigrations blogpython manage.py makemigrations commentpython manage.py makemigrations tool```最后执行：  ```python manage.py migrate```上面的命令全部执行完毕，如果不报错，那么关于项目的数据库迁移就结束了，可以开始运行项目了，可以发现服务器上面保存的信息已经全部移植到了本地。  不过，由于我的博客项目中的用户系统中应用了第三方账号登录，而第三方账号登录使用的是 Oauth 协议，这个就决定了第三方账号的登录是跟域名绑定的，所以在本地已经不能使用第三方账号登录了，而自带的用户系统的账号还是可以登录的。',2,'我的 Django 项目做了一次实际的项目移植，就是把同一个项目连同数据库中存储的信息迁移到另外一个环境中，具体是把服务器上面的数据库迁移到了本地，也就是 Linux 服务器到本地 Windows，这篇文章就来简述一下我具体的操作过程。','一次完整的 Django 项目的迁移，有关 MySQL 数据库的导出与导入','2018-06-20 10:33:36','Roger',15),(20,'2018-06-19 23:27:58','<p>我的 Django 博客项目是部署在阿里云 ECS 服务器上面的，服务器的系统是64位的 Ubuntu 16.04 系统，部署的方式是使用 Nginx + Gunicorn 实现，数据使用的是 MySQL。部署其实是一个大坑，我在部署的过程中也是踩过很多坑，所以这篇文章就来介绍一下我的项目的完整部署过程，希望看到的人能少走弯路。</p><h2 id=\"h2-u9879u76EEu51C6u5907\"><a name=\"项目准备\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目准备</h2><p>首先需要把自己本地的项目放到服务器上面来，我使用的是 Github 克隆项目，这种从代码库克隆的方式是比较推荐的，因为可以持续的使用 pull 来让服务器上面的项目保持跟代码仓库中同步。Github 的安装、配置和使用这里省略，如果需要请自行去查阅相关资料完成操作。</p><h3 id=\"h3--github-\"><a name=\"从 Github 上克隆项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>从 Github 上克隆项目</h3><p>选择一个放置项目的文件夹，比如我把项目统一放在了自己的一个用户的根目录下面，这个目录的路径是 /home/alex  </p><p>于是可以切换到当前用户的目录下克隆项目：  </p><pre><code>~$ git clone git@github.com:Hopetree/izone.git tendcode</code></pre><p>上面这句 git 的命令是意思是将 izone.git 这个项目克隆到本地并命名为 tendcode，当然，项目的名称你可以按照自己的喜欢去命名。  </p><p>项目移植成功了，我们还需要来移植一个单独给项目使用的环境，所以需要使用虚拟环境。虚拟环境的安装和配置操作方式这里也不做说明，这里只介绍创建虚拟环境的过程。<br>我虽然在本地的 Windows 上面一直使用virtualenvwrapper 来操作虚拟环境，但是在服务器上面还是比较喜欢直接使用 virtualenv，这里就来以这种创建虚拟环境的方式说明。  </p><p>在当前用户根目录（跟刚才克隆项目同目录）下创建一个虚拟环境 izone_env，使用如下命令：</p><pre><code>~$ virtualenv izone_env</code></pre><p>此时当前目录的结构是这样的：</p><pre><code>/home/alex/tendcode/home/alex/izone_env</code></pre><h3 id=\"h3-u590Du5236u865Au62DFu73AFu5883\"><a name=\"复制虚拟环境\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>复制虚拟环境</h3><p>虚拟环境虽然已经创建，但是环境中还没有安装项目的依赖，所以现在要根据项目的依赖文件去安装依赖。  </p><p>首先在当前用户目录下使用如下命令进入虚拟环境： </p><pre><code>~$ source izone_env/bin/activate</code></pre><p>然后将当前目录切换到你的项目的依赖文件 requirements.txt 的目录下，比如我的项目的依赖文件就在项目的一级目录下面，比如它的地址是这样的：   </p><pre><code>/home/alex/tendcode/requirements.txt</code></pre><p>那么此时应该切换到这样：</p><pre><code>(izone_env) ~$ cd tendcode</code></pre><p>然后使用如下命令安装依赖：</p><pre><code>(izone_env) ~$ pip install -r requirements.txt</code></pre><p>此时，项目的基本运行条件已经准备好了，下面开始运行项目。</p><h2 id=\"h2-u9879u76EEu8FD0u884C\"><a name=\"项目运行\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目运行</h2><p>在部署项目之前，先要保证项目在服务器上面能够正常运行，这是最起码的条件。</p><h3 id=\"h3-u8865u5145u9879u76EEu7F3Au5C11u7684u6587u4EF6\"><a name=\"补充项目缺少的文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>补充项目缺少的文件</h3><p>这一步骤并不是一定需要的，这取决于你的项目。由于我的项目上传到 Github 上之前有忽略掉一个个人信息项目的配置文件，所以需要在克隆项目之后在服务器自行创建一份。比如我的博客项目中需要单独创建的是跟 settings.py 同级目录下面的一个 base_settings.py 文件，文件的具体内容可以查看我 Github 项目中的说明。如果你的项目不需要补充文件，可以跳过这一步。</p><h3 id=\"h3-u521Bu5EFAu6570u636Eu5E93\"><a name=\"创建数据库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建数据库</h3><p>如果项目同样适用的是 MySQL 数据库的话，在项目运行之前需要先创建数据库，比如我的项目中指定了数据库的基本信息，我创建数据库（进入mysql命令行下）的命令如下：  </p><pre><code>mysql &gt; CREATE DATABASE `tendcode` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;</code></pre><p>这句命令的意思是创建一个名称为 tendcode 的数据库，并且将数据库的编码设定为 utf8mb4，这个按照自己的项目需求去创建即可。</p><h2 id=\"h2-u8FC1u79FBu6570u636Eu5E93\"><a name=\"迁移数据库\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>迁移数据库</h2><p>现在可以按照 Django 项目的数据库迁移步骤来操作了，当然，下面的操作都是在虚拟环境中进行的。  </p><ol><li>创建数据迁移，命令如下：<pre><code>(izone_env) ~/tendcode$ python manage.py makemigrations(izone_env) ~/tendcode$ python manage.py migrate</code></pre></li><li>创建管理员账号：<pre><code>(izone_env) ~/tendcode$ python manage.py createsuperuser</code></pre></li><li>静态文件收集<pre><code>(izone_env) ~/tendcode$ python manage.py collectstatic</code></pre><h3 id=\"h3-u542Fu52A8u9879u76EE\"><a name=\"启动项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>启动项目</h3><pre><code>(izone_env) ~/tendcode$ python manage.py runserver 0.0.0.1:8000</code></pre>如果你的服务器上面的8000端口开启了，那么可以访问你的服务器 IP 地址的8000端口看看项目是否正常运行：<pre><code>http://server_domain_or_IP:8000</code></pre>到这里顺便说一下，由于我的项目是有域名的，所以在项目中要先添加自己的域名，就像这样：<pre><code>ALLOWED_HOSTS = [&#39;127.0.0.1&#39;, &#39;localhost&#39;, &#39;.tendcode.com&#39;]</code></pre><h2 id=\"h2-u5F00u59CBu90E8u7F72\"><a name=\"开始部署\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>开始部署</h2><h3 id=\"h3--gunicorn\"><a name=\"安装和配置 Gunicorn\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装和配置 Gunicorn</h3></li><li>首先需要在虚拟环境中安装 Gunicorn：<pre><code>(izone_env) ~/tendcode$ pip install gunicorn</code></pre></li><li>创建项目的 Gunicorn 配置文件（退出虚拟环境）：<pre><code>~$ sudo vim /etc/systemd/system/gunicorn_tendcode.service</code></pre></li><li>配置信息如下：<br>```<br>[Unit]<br>Description=gunicorn daemon<br>After=network.target</li></ol><p>[Service]<br>User=alex<br>Group=www-data<br>WorkingDirectory=/home/alex/tendcode<br>ExecStart=/home/alex/izone_env/bin/gunicorn ?access-logfile - ?workers 2 ?bind unix:/home/alex/tendcode/tendcode.sock izone.wsgi:application</p><p>[Install]<br>WantedBy=multi-user.target</p><pre><code>上面的配置信息中需要根据自己的项目改的有以下几个地方：  * User 填写自己当前用户名称  * WorkingDirectory 填写项目的地址  * ExecStart 中第一个地址是虚拟环境中 gunicorn 的目录，所以只需要改前半部分虚拟环境的地址即可  * workers 2 这里是表示2个进程，可以自己改  * unix 这里的地址是生成一个 sock 文件的地址，直接写在项目的根目录即可* izone.wsgi 表示的是项目中 wsgi.py 的地址，我的项目中就是在 izone 文件夹下的  ### 启动配置文件文件配置完成之后，使用下面的命令启动服务：</code></pre><p>~$ sudo systemctl start gunicorn_tendcode<br>~$ sudo systemctl enable gunicorn_tendcode</p><pre><code>查看服务的状态可以使用命令：</code></pre><p>~$ sudo systemctl status gunicorn_tendcode</p><pre><code>上面的命令启动没有问题可以看看自己的项目的跟目录下面，应该会多一个 tendcod.sock 文件的。后续如果对 gunicorn 配置文件做了修改，那么应该先使用这个命令之后重启：</code></pre><p>~$ sudo systemctl daemon-reload</p><pre><code>然后再使用重启命令：</code></pre><p>~$ sudo systemctl restart gunicorn_tendcode</p><pre><code>### 配置 Nginx首先创建一个 Nginx 配置文件，不要使用默认的那个：</code></pre><p>~$ sudo nano /etc/nginx/sites-available/mynginx</p><pre><code>配置信息如下：</code></pre><p>server {</p><pre><code># 端口和域名listen 80;server_name www.tendcode.com;# 日志access_log /home/alex/tendcode/logs/nginx.access.log;error_log /home/alex/tendcode/logs/nginx.error.log;# 不记录访问不到 favicon.ico 的报错日志location = /favicon.ico { access_log off; log_not_found off; }# static 和 media 的地址location /static/ {    root /home/alex/tendcode;}location /media/ {    root /home/alex/tendcode;}# gunicorn 中生成的文件的地址location / {    include proxy_params;    proxy_pass http://unix:/home/alex/tendcode/tendcode.sock;}</code></pre><p>}</p><p>server {<br>    listen 80;<br>    server_name tendcode.com;<br>    rewrite ^(.*) <a href=\"http://www.tendcode.com$1\">http://www.tendcode.com$1</a> permanent;<br>}</p><pre><code>第一个 server 是主要的配置，第二 server 是实现301跳转，即让不带 www 的域名跳转到带有 www 的域名上面。### 连接 Nginx 配置上面的配置检查好之后，使用下面的命令来将这个配置跟 Nginx 建立连接，使用命令：</code></pre><p>~$ sudo ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled</p><pre><code>运行完毕之后可以查看一下 Nginx 的运营情况，看看会不会报错：</code></pre><p>~$ sudo nginx -t</p><pre><code>如果上面这句没有报错，那么恭喜你，你的配置文件没有问题，可以继续下一步，如果报错了，需要按照报错的信息去更改配置文件中对应行的代码，好好检查一下吧！  没报错的话，重启一下 Nginx：</code></pre><p>~$ sudo systemctl restart nginx</p><pre><code>好了，重启 Nginx 之后可以登录自己配置的域名，看看自己的项目是不是已经成功的运行了呢！  ## 后续维护之后的项目维护中，如果更改了 gunicorn 的配置文件，那么需要依次执行下面两条语句去重启服务，如果只是修改了 Django 项目的内容，只需要单独执行第二条重启命令即可：</code></pre><p>~$ sudo systemctl daemon-reload<br>~$ sudo systemctl restart gunicorn_tendcode</p><pre><code>如果修改了 Nginx 的配置文件，那么需要依次执行下面两条语句去重启服务：</code></pre><p>~$ sudo nginx -t<br>~$ sudo systemctl restart nginx<br>```<br>以上就是我的项目部署的全部过程，希望看到这篇文章的人如果想要使用同样的方式部署 Django 项目的话，可以参考一下，有问题也可以指出以上就是我的项目部署的全部过程，希望看到这篇文章的人如果想要使用同样的方式部署 Django 项目的话，可以参考一下，有问题也可以指出。。</p>','/imgs/gun.png','我的 Django 博客项目是部署在阿里云 ECS 服务器上面的，服务器的系统是64位的 Ubuntu 16.04 系统，部署的方式是使用 Nginx + Gunicorn 实现，数据使用的是 MySQL。部署其实是一个大坑，我在部署的过程中也是踩过很多坑，所以这篇文章就来介绍一下我的项目的完整部署过程，希望看到的人能少走弯路。## 项目准备首先需要把自己本地的项目放到服务器上面来，我使用的是 Github 克隆项目，这种从代码库克隆的方式是比较推荐的，因为可以持续的使用 pull 来让服务器上面的项目保持跟代码仓库中同步。Github 的安装、配置和使用这里省略，如果需要请自行去查阅相关资料完成操作。### 从 Github 上克隆项目选择一个放置项目的文件夹，比如我把项目统一放在了自己的一个用户的根目录下面，这个目录的路径是 /home/alex  于是可以切换到当前用户的目录下克隆项目：  ```~$ git clone git@github.com:Hopetree/izone.git tendcode```上面这句 git 的命令是意思是将 izone.git 这个项目克隆到本地并命名为 tendcode，当然，项目的名称你可以按照自己的喜欢去命名。  项目移植成功了，我们还需要来移植一个单独给项目使用的环境，所以需要使用虚拟环境。虚拟环境的安装和配置操作方式这里也不做说明，这里只介绍创建虚拟环境的过程。我虽然在本地的 Windows 上面一直使用virtualenvwrapper 来操作虚拟环境，但是在服务器上面还是比较喜欢直接使用 virtualenv，这里就来以这种创建虚拟环境的方式说明。  在当前用户根目录（跟刚才克隆项目同目录）下创建一个虚拟环境 izone_env，使用如下命令：```~$ virtualenv izone_env```此时当前目录的结构是这样的：```/home/alex/tendcode/home/alex/izone_env```### 复制虚拟环境虚拟环境虽然已经创建，但是环境中还没有安装项目的依赖，所以现在要根据项目的依赖文件去安装依赖。  首先在当前用户目录下使用如下命令进入虚拟环境： ```~$ source izone_env/bin/activate```然后将当前目录切换到你的项目的依赖文件 requirements.txt 的目录下，比如我的项目的依赖文件就在项目的一级目录下面，比如它的地址是这样的：   ```/home/alex/tendcode/requirements.txt```那么此时应该切换到这样：```(izone_env) ~$ cd tendcode```然后使用如下命令安装依赖：```(izone_env) ~$ pip install -r requirements.txt```此时，项目的基本运行条件已经准备好了，下面开始运行项目。## 项目运行在部署项目之前，先要保证项目在服务器上面能够正常运行，这是最起码的条件。### 补充项目缺少的文件这一步骤并不是一定需要的，这取决于你的项目。由于我的项目上传到 Github 上之前有忽略掉一个个人信息项目的配置文件，所以需要在克隆项目之后在服务器自行创建一份。比如我的博客项目中需要单独创建的是跟 settings.py 同级目录下面的一个 base_settings.py 文件，文件的具体内容可以查看我 Github 项目中的说明。如果你的项目不需要补充文件，可以跳过这一步。### 创建数据库如果项目同样适用的是 MySQL 数据库的话，在项目运行之前需要先创建数据库，比如我的项目中指定了数据库的基本信息，我创建数据库（进入mysql命令行下）的命令如下：  ```mysql > CREATE DATABASE `tendcode` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;```这句命令的意思是创建一个名称为 tendcode 的数据库，并且将数据库的编码设定为 utf8mb4，这个按照自己的项目需求去创建即可。## 迁移数据库现在可以按照 Django 项目的数据库迁移步骤来操作了，当然，下面的操作都是在虚拟环境中进行的。  1. 创建数据迁移，命令如下：```(izone_env) ~/tendcode$ python manage.py makemigrations(izone_env) ~/tendcode$ python manage.py migrate```2. 创建管理员账号：```(izone_env) ~/tendcode$ python manage.py createsuperuser```3. 静态文件收集```(izone_env) ~/tendcode$ python manage.py collectstatic```### 启动项目```(izone_env) ~/tendcode$ python manage.py runserver 0.0.0.1:8000```如果你的服务器上面的8000端口开启了，那么可以访问你的服务器 IP 地址的8000端口看看项目是否正常运行：```http://server_domain_or_IP:8000```到这里顺便说一下，由于我的项目是有域名的，所以在项目中要先添加自己的域名，就像这样：```ALLOWED_HOSTS = [\'127.0.0.1\', \'localhost\', \'.tendcode.com\']```## 开始部署### 安装和配置 Gunicorn1. 首先需要在虚拟环境中安装 Gunicorn：```(izone_env) ~/tendcode$ pip install gunicorn```2. 创建项目的 Gunicorn 配置文件（退出虚拟环境）：```~$ sudo vim /etc/systemd/system/gunicorn_tendcode.service```3. 配置信息如下：```[Unit]Description=gunicorn daemonAfter=network.target[Service]User=alexGroup=www-dataWorkingDirectory=/home/alex/tendcodeExecStart=/home/alex/izone_env/bin/gunicorn --access-logfile - --workers 2 --bind unix:/home/alex/tendcode/tendcode.sock izone.wsgi:application[Install]WantedBy=multi-user.target```上面的配置信息中需要根据自己的项目改的有以下几个地方：  * User 填写自己当前用户名称  * WorkingDirectory 填写项目的地址  * ExecStart 中第一个地址是虚拟环境中 gunicorn 的目录，所以只需要改前半部分虚拟环境的地址即可  * workers 2 这里是表示2个进程，可以自己改  * unix 这里的地址是生成一个 sock 文件的地址，直接写在项目的根目录即可* izone.wsgi 表示的是项目中 wsgi.py 的地址，我的项目中就是在 izone 文件夹下的  ### 启动配置文件文件配置完成之后，使用下面的命令启动服务：  ```~$ sudo systemctl start gunicorn_tendcode~$ sudo systemctl enable gunicorn_tendcode```查看服务的状态可以使用命令：  ```~$ sudo systemctl status gunicorn_tendcode```上面的命令启动没有问题可以看看自己的项目的跟目录下面，应该会多一个 tendcod.sock 文件的。后续如果对 gunicorn 配置文件做了修改，那么应该先使用这个命令之后重启：```~$ sudo systemctl daemon-reload```然后再使用重启命令：  ```~$ sudo systemctl restart gunicorn_tendcode```### 配置 Nginx首先创建一个 Nginx 配置文件，不要使用默认的那个：```~$ sudo nano /etc/nginx/sites-available/mynginx```配置信息如下：```server {    # 端口和域名    listen 80;    server_name www.tendcode.com;    # 日志    access_log /home/alex/tendcode/logs/nginx.access.log;    error_log /home/alex/tendcode/logs/nginx.error.log;    # 不记录访问不到 favicon.ico 的报错日志    location = /favicon.ico { access_log off; log_not_found off; }    # static 和 media 的地址    location /static/ {        root /home/alex/tendcode;    }    location /media/ {        root /home/alex/tendcode;    }    # gunicorn 中生成的文件的地址    location / {        include proxy_params;        proxy_pass http://unix:/home/alex/tendcode/tendcode.sock;    }}server {    listen 80;    server_name tendcode.com;    rewrite ^(.*) http://www.tendcode.com$1 permanent;}```第一个 server 是主要的配置，第二 server 是实现301跳转，即让不带 www 的域名跳转到带有 www 的域名上面。### 连接 Nginx 配置上面的配置检查好之后，使用下面的命令来将这个配置跟 Nginx 建立连接，使用命令：```~$ sudo ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled```运行完毕之后可以查看一下 Nginx 的运营情况，看看会不会报错：```~$ sudo nginx -t```如果上面这句没有报错，那么恭喜你，你的配置文件没有问题，可以继续下一步，如果报错了，需要按照报错的信息去更改配置文件中对应行的代码，好好检查一下吧！  没报错的话，重启一下 Nginx：```~$ sudo systemctl restart nginx```好了，重启 Nginx 之后可以登录自己配置的域名，看看自己的项目是不是已经成功的运行了呢！  ## 后续维护之后的项目维护中，如果更改了 gunicorn 的配置文件，那么需要依次执行下面两条语句去重启服务，如果只是修改了 Django 项目的内容，只需要单独执行第二条重启命令即可：  ```~$ sudo systemctl daemon-reload~$ sudo systemctl restart gunicorn_tendcode```如果修改了 Nginx 的配置文件，那么需要依次执行下面两条语句去重启服务：```~$ sudo nginx -t~$ sudo systemctl restart nginx```以上就是我的项目部署的全部过程，希望看到这篇文章的人如果想要使用同样的方式部署 Django 项目的话，可以参考一下，有问题也可以指出以上就是我的项目部署的全部过程，希望看到这篇文章的人如果想要使用同样的方式部署 Django 项目的话，可以参考一下，有问题也可以指出。。',1,'我的 Django 博客项目是部署在阿里云 ECS 服务器上面的，服务器的系统是64位的 Ubuntu 16.04 系统，部署的方式是使用 Nginx + Gunicorn 实现，数据使用的是 MySQL。部署其实是一个大坑，我在部署的过程中也是踩过很多...','在 Linux 服务器上使用 Nginx + Gunicorn 部署 Django 项目的正确姿势','2018-06-20 10:09:23','Roger',15);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_comments`
--

DROP TABLE IF EXISTS `article_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_comments` (
  `article_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_3p3q8lmg108o11h9tix5mdfb3` (`comments_id`),
  KEY `FKhdo7dtp0o8cn5wo7j1cs1gokg` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_comments`
--

LOCK TABLES `article_comments` WRITE;
/*!40000 ALTER TABLE `article_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_tag` (
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  KEY `FKesqp7s9jj2wumlnhssbme5ule` (`tag_id`),
  KEY `FKenqeees0y8hkm7x1p1ittuuye` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` VALUES (1,3),(1,4),(1,5),(14,16),(14,17),(14,18),(14,19),(20,3),(20,16),(20,17),(20,18),(20,21),(20,22),(20,5);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Python 在设计上坚持了清晰划一的风格，这使得 Python 成为一门易读、易维护，并且被大量用户所欢迎的、用途广泛的语言。','Python基础'),(15,'Python web开发是使用 Python 作为后端开发的语言进行 web 项目开发，常用的库是 Django 和 Flask。','Python Web开发');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `reply_name` varchar(255) DEFAULT NULL,
  `author_username` varchar(10) DEFAULT NULL,
  `belong_article_id` bigint(20) DEFAULT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9m4ghvfqy71b9clmsty1mok9s` (`author_username`),
  KEY `FKothvxywq0wb6gg77kd5v5dv2x` (`belong_article_id`),
  KEY `FKhvh0e2ybgg16bpu229a5teje7` (`parent_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (6,'<p>hello world.</p>\n',NULL,NULL,'Roger',1,NULL),(7,'<p>hello</p>\n',NULL,NULL,'Roger',1,NULL),(8,'<p>i love you.</p>\n',NULL,'Roger','Roger',NULL,6),(9,'<p>test</p>\n',NULL,NULL,'Roger',1,NULL),(10,'<p>test three</p>\n',NULL,NULL,'Roger',1,NULL),(11,'<p>I love you too.</p>\n',NULL,'Roger','Roger',NULL,6),(13,'<p>写的真是不错</p>\n','2018-06-19 23:15:36',NULL,'chaochao',1,NULL),(23,'<p>test</p>\n','2018-06-20 10:09:52',NULL,'Roger',20,NULL),(24,'<p>抢楼</p>\n','2018-06-20 10:31:24',NULL,'chaochao',14,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_child_comments`
--

DROP TABLE IF EXISTS `comment_child_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_child_comments` (
  `comment_id` bigint(20) NOT NULL,
  `child_comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_840qdrno4bt4fi1v6owsfglqx` (`child_comments_id`),
  KEY `FK46hyxd0i0rv9kokc7kq65of3h` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_child_comments`
--

LOCK TABLES `comment_child_comments` WRITE;
/*!40000 ALTER TABLE `comment_child_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_child_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (25),(25),(25),(25);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(12,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (3,'Virtualenv 是 Python 用来创建虚拟环境的包，虚拟环境是一个相对独立的开发环境，可以用来控制项目依赖库的版本和 Python 的版本，便于项目的管理和移植。','Virtualenv'),(4,NULL,'Python 后端'),(5,NULL,'Linux'),(16,NULL,'后端开发'),(17,NULL,'Diango'),(18,NULL,'MySQL'),(19,NULL,'数据库'),(21,NULL,'Nginx'),(22,NULL,'Gunicorn');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(10) NOT NULL,
  `avatar_link` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Roger','/imgs/avatar.png','rogeryk@outlook.com','{bcrypt}$2a$10$HNASX2Eay0W88Tz1xPcRY.EK5Fuc.FB6EL4Sc9/ehG5GjUBlhPsCO'),('chaochao','/imgs/avatar.png','chaochao@qq.com','{bcrypt}$2a$10$Oh7E4qOvR.cNnUyjcmvUVO/vFJ2llKakM6Xq/I5rRIDcYG5JQptqC');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_receive_comments`
--

DROP TABLE IF EXISTS `user_receive_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_receive_comments` (
  `user_username` varchar(10) NOT NULL,
  `receive_comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ilofaejppvfy7imqha548u4yv` (`receive_comments_id`),
  KEY `FKlgelpxm9e9l7yal6i5cfnvp0n` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_receive_comments`
--

LOCK TABLES `user_receive_comments` WRITE;
/*!40000 ALTER TABLE `user_receive_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_receive_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `user_username` varchar(10) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`),
  KEY `FK1misndtpfm9hx3ttvixdus8d1` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('Roger',1),('Roger',1),('Roger',1),('chaochao',12);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-20 19:11:50

