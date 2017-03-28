Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csoFR-0006tT-8l
 for ath10k@lists.infradead.org; Tue, 28 Mar 2017 10:21:31 +0000
Received: by mail-ot0-x230.google.com with SMTP id t8so44149470otf.3
 for <ath10k@lists.infradead.org>; Tue, 28 Mar 2017 03:20:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <05a38580-2a91-62f1-8e6f-e59c8604c047@gmail.com>
References: <05a38580-2a91-62f1-8e6f-e59c8604c047@gmail.com>
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Date: Tue, 28 Mar 2017 12:20:43 +0200
Message-ID: <CALhHN=rn1XOrzqCMGX=XkxY9wuzY4WVeD4+9aEG-Zp7Qwv=Yow@mail.gmail.com>
Subject: Re: How to integrate the latest ath10k driver into an older kernel
 release ?
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Wu Chung-I <uranus0206@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 24 March 2017 at 12:25, Wu Chung-I <uranus0206@gmail.com> wrote:
> Hi Janusz:
> I follow your procedure (include patched your attachment).
> I can generate but failing compile.
> Any advise?
> My environment is Ubuntu 16.04 (same with you), git the backports and
> checkout to master.
>
I have ubuntu with 4.9-rc6 kernel - probably because of that works for me.
With 4.4 (ubuntu orginal kernel) also fail - don't know kvmalloc() -
seems like bug in backports ...
Best, report this to backports group :)


> Log of make:
> make[5]: 'conf' is up to date.
> #
> # configuration written to .config
> #
> Building backport-include/backport/autoconf.h ... done.
>   CC [M]  /home/chungyi/backports-output/compat/main.o
>   CC [M]  /home/chungyi/backports-output/compat/backport-4.5.o
>   CC [M]  /home/chungyi/backports-output/compat/backport-4.6.o
>   CC [M]  /home/chungyi/backports-output/compat/backport-4.7.o
>   CC [M]  /home/chungyi/backports-output/compat/backport-4.8.o
>   CC [M]  /home/chungyi/backports-output/compat/lib-rhashtable.o
> scripts/Makefile.build:258: recipe for target
> '/home/chungyi/backports-output/compat/lib-rhashtable.o' failed
> scripts/Makefile.build:403: recipe for target
> '/home/chungyi/backports-output/compat' failed
> Makefile:1418: recipe for target '_module_/home/chungyi/backports-output'
> failed
> Makefile.build:6: recipe for target 'modules' failed
> Makefile.real:88: recipe for target 'modules' failed
> Makefile:40: recipe for target 'modules' failed
> Makefile:30: recipe for target 'default' failed
>   CC [M]  /home/chungyi/backports-output/compat/lib-rhashtable.o
> scripts/Makefile.build:258: recipe for target
> '/home/chungyi/backports-output/compat/lib-rhashtable.o' failed
> scripts/Makefile.build:403: recipe for target
> '/home/chungyi/backports-output/compat' failed
> Makefile:1418: recipe for target '_module_/home/chungyi/backports-output'
> failed
> Makefile.build:6: recipe for target 'modules' failed
> Makefile.real:88: recipe for target 'modules' failed
> Makefile:40: recipe for target 'modules' failed
> Makefile:30: recipe for target 'default' failed
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
