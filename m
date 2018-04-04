Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx.socionext.com ([202.248.49.38])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3Xf2-0002nL-QH
 for ath10k@lists.infradead.org; Wed, 04 Apr 2018 01:56:31 +0000
From: <yamada.masahiro@socionext.com>
Subject: RE: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN module
Date: Wed, 4 Apr 2018 01:56:12 +0000
Message-ID: <cef0a8eddfdc499e8bb34898eb5ed29d@SOC-EX01V.e01.socionext.com>
References: <1518684458-5338-1-git-send-email-govinds@codeaurora.org>
 <87371kqfda.fsf@kamboji.qca.qualcomm.com>
 <d396df1b09da4dd7aa14d6af2c2b2b18@aphydexm01b.ap.qualcomm.com>
 <87tvttl6kp.fsf@kamboji.qca.qualcomm.com>
 <fb2c04383f024ab8b2c62dd5a4ad20ac@SOC-EX01V.e01.socionext.com>
 <87lgf0cn24.fsf@kamboji.qca.qualcomm.com>
 <eccd10c7db468515fe255b75f102e301@codeaurora.org>
In-Reply-To: <eccd10c7db468515fe255b75f102e301@codeaurora.org>
Content-Language: ja-JP
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: govinds@codeaurora.org, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi.

> -----Original Message-----
> From: govinds@codeaurora.org [mailto:govinds@codeaurora.org]
> Sent: Friday, March 23, 2018 8:55 PM
> To: Kalle Valo <kvalo@codeaurora.org>
> Cc: Yamada, Masahiro/山田 真弘 <yamada.masahiro@socionext.com>;
> linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> Subject: Re: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN
> module
> 
> On 2018-03-10 14:41, Kalle Valo wrote:
> > <yamada.masahiro@socionext.com> writes:
> >
> >>> >> Kbuild bot found an odd problem with this patch:
> >>> >>
> >>> >>  include/linux/dynamic_debug.h:77:14: error: 'KBUILD_MODNAME'
> >>> >>  undeclared (first use in this function); did you mean
> >>> 'KBUILD_BASENAME'?
> >>> >>
> >>> >> Full report:
> >>> >>
> >>> >>
> >>>
> http://lists.infradead.org/pipermail/ath10k/2018-February/010907.html
> >>> >>
> >>> >> Any ideas? Is this is some unrelated issue or what? This patch is
> not
> >>> >> even touching hif.h or ce.c.
> >>> >
> >>> > I didn't encountered this issue as in my defconfig only
> >>> > CONFIG_ATH10K_SNOC was defined. This problem is coming when we define
> >>> > CONFIG_ATH10K_SNOC and CONFIG_ATH10K_PCI simultaneously in defconfig
> >>> > and this is known issue when multiple modules share objects(in this
> >>> > case ce.o). I saw similar reported problem and found
> >>> > https://patchwork.kernel.org/patch/10060825/.
> >>> >
> >>> > After picking the below change issue is not seen.
> >>>
> >>> Let's ask the kbuild maintainer. Masahiro, any chances of getting
> >>> this
> >>> patch applied anytime soon:
> >>>
> >>> kbuild: define KBUILD_MODNAME even if multiple modules share objects
> >>>
> >>> https://patchwork.kernel.org/patch/10060825/
> >>>
> >>> In ath10k we would need it as otherwise we are not able to link ce.o
> >>> both to ath10k_pci.ko and ath10k_snoc.ko. What do you think?
> >>>
> >>> Full discussion and the ath10k patch here:
> >>>
> >>> https://patchwork.kernel.org/patch/10220657/
> >>>
> >>
> >> I plan to submit v2, but even if the undefined KBUILD_MODNAME is
> >> fixed,
> >> I expect another problem from this patch.
> >>
> >> If both CONFIG_ATH10K_PCI and CONFIG_ATH10_SNOC are 'y'
> >> two instances of ce.o would be linked into vmliux,
> >> then causes multiple definition error.
> >
> > Oh, I didn't realise this. Thanks for pointing it out. Govind is
> > looking
> > at other ways to fix this.
> 
> https://patchwork.kernel.org/patch/10298659/ is raised to address this
> problem.
> 



> CE layer is shared between pci and snoc target and results
> in duplicate object inclusion if both modules are compiled
> together statically and undefined KBUILD_MODNAME if
> compiled as module.


If you rebase your development on v4.17-rc1,
this statement is no longer true.


> Fix this by building ce layer in ath10k core module by
> adding ce object inclusion with ATH10K_CE boolean CONFIG.




Today, the solution landed in Linus' tree.

[1] Solution for missing KBUILD_MODNAME definition

commit aeacb019b61c4ea7689085574bd03d2c0810f119
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Mar 19 18:01:24 2018 +0900

    kbuild: define KBUILD_MODNAME even if multiple modules share objects



[2] Solution for multiple definition error when both are built-in

commit f98fe47ce51dee6d97dd91bbeccdde23f043c754
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Mar 19 20:26:08 2018 +0900

    kbuild: link $(real-obj-y) instead of $(obj-y) into built-in.a




[3] Examples for Makefile cleanups


commit f605005a50fc1443a14b4e8c9c1727881f8f96ae
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Mar 19 20:26:10 2018 +0900

    net: liquidio: clean up Makefile for simpler composite object handling



commit dc35da16a2e23db04822f0129cd5b28b7b0e72b4
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Mar 19 20:26:09 2018 +0900

    lib: zstd: clean up Makefile for simpler composite object handling

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
