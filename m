Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crjfA-0006PC-TB
 for ath10k@lists.infradead.org; Sat, 25 Mar 2017 11:15:19 +0000
Received: by mail-wm0-x22e.google.com with SMTP id n11so9082775wma.0
 for <ath10k@lists.infradead.org>; Sat, 25 Mar 2017 04:14:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <05a38580-2a91-62f1-8e6f-e59c8604c047@gmail.com>
References: <05a38580-2a91-62f1-8e6f-e59c8604c047@gmail.com>
From: "K.Mani" <sailormani@gmail.com>
Date: Sat, 25 Mar 2017 16:44:52 +0530
Message-ID: <CACBNxUEL_W9ErsdxG2vHb4=u6UOvaS32=zJO8GR8+ze6W+uMzA@mail.gmail.com>
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
Cc: ath10k@lists.infradead.org

i'd used 'compat-wireless-2016-10-08' from lede-dev, to run
qca9984(PCIe) on linux-3.10.20
https://sources.lede-project.org/

i remember facing issue in 'skb_get_hash_perturb' as the symbol is not
defined & build was failing, but mac80211 in lede-dev patches the
symbol definition.
You can make verbose build to find the exact cause of build fail.

I'd also applied few minor patch on my own to support my board.

Thanks
Mani

On Fri, Mar 24, 2017 at 4:55 PM, Wu Chung-I <uranus0206@gmail.com> wrote:
> Hi Janusz:
> I follow your procedure (include patched your attachment).
> I can generate but failing compile.
> Any advise?
> My environment is Ubuntu 16.04 (same with you), git the backports and
> checkout to master.
>
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
