Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crNM1-0002lx-Mv
 for ath10k@lists.infradead.org; Fri, 24 Mar 2017 11:26:03 +0000
Received: by mail-pg0-x233.google.com with SMTP id g2so7448642pge.3
 for <ath10k@lists.infradead.org>; Fri, 24 Mar 2017 04:25:41 -0700 (PDT)
Received: from [192.168.78.67] (60-248-0-61.HINET-IP.hinet.net. [60.248.0.61])
 by smtp.gmail.com with ESMTPSA id
 z19sm4180594pfd.81.2017.03.24.04.25.38
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Mar 2017 04:25:39 -0700 (PDT)
From: Wu Chung-I <uranus0206@gmail.com>
Subject: Re: How to integrate the latest ath10k driver into an older kernel
 release ?
Message-ID: <05a38580-2a91-62f1-8e6f-e59c8604c047@gmail.com>
Date: Fri, 24 Mar 2017 19:25:37 +0800
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi Janusz:
I follow your procedure (include patched your attachment).
I can generate but failing compile.
Any advise?
My environment is Ubuntu 16.04 (same with you), git the backports and 
checkout to master.

Log of make:
make[5]: 'conf' is up to date.
#
# configuration written to .config
#
Building backport-include/backport/autoconf.h ... done.
   CC [M]  /home/chungyi/backports-output/compat/main.o
   CC [M]  /home/chungyi/backports-output/compat/backport-4.5.o
   CC [M]  /home/chungyi/backports-output/compat/backport-4.6.o
   CC [M]  /home/chungyi/backports-output/compat/backport-4.7.o
   CC [M]  /home/chungyi/backports-output/compat/backport-4.8.o
   CC [M]  /home/chungyi/backports-output/compat/lib-rhashtable.o
scripts/Makefile.build:258: recipe for target 
'/home/chungyi/backports-output/compat/lib-rhashtable.o' failed
scripts/Makefile.build:403: recipe for target 
'/home/chungyi/backports-output/compat' failed
Makefile:1418: recipe for target 
'_module_/home/chungyi/backports-output' failed
Makefile.build:6: recipe for target 'modules' failed
Makefile.real:88: recipe for target 'modules' failed
Makefile:40: recipe for target 'modules' failed
Makefile:30: recipe for target 'default' failed
   CC [M]  /home/chungyi/backports-output/compat/lib-rhashtable.o
scripts/Makefile.build:258: recipe for target 
'/home/chungyi/backports-output/compat/lib-rhashtable.o' failed
scripts/Makefile.build:403: recipe for target 
'/home/chungyi/backports-output/compat' failed
Makefile:1418: recipe for target 
'_module_/home/chungyi/backports-output' failed
Makefile.build:6: recipe for target 'modules' failed
Makefile.real:88: recipe for target 'modules' failed
Makefile:40: recipe for target 'modules' failed
Makefile:30: recipe for target 'default' failed


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
