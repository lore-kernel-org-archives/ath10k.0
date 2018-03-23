Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLHm-0001qx-Ln
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 11:55:09 +0000
MIME-Version: 1.0
Date: Fri, 23 Mar 2018 17:24:55 +0530
From: govinds@codeaurora.org
Subject: Re: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN module
In-Reply-To: <87lgf0cn24.fsf@kamboji.qca.qualcomm.com>
References: <1518684458-5338-1-git-send-email-govinds@codeaurora.org>
 <87371kqfda.fsf@kamboji.qca.qualcomm.com>
 <d396df1b09da4dd7aa14d6af2c2b2b18@aphydexm01b.ap.qualcomm.com>
 <87tvttl6kp.fsf@kamboji.qca.qualcomm.com>
 <fb2c04383f024ab8b2c62dd5a4ad20ac@SOC-EX01V.e01.socionext.com>
 <87lgf0cn24.fsf@kamboji.qca.qualcomm.com>
Message-ID: <eccd10c7db468515fe255b75f102e301@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: yamada.masahiro@socionext.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-03-10 14:41, Kalle Valo wrote:
> <yamada.masahiro@socionext.com> writes:
> 
>>> >> Kbuild bot found an odd problem with this patch:
>>> >>
>>> >>  include/linux/dynamic_debug.h:77:14: error: 'KBUILD_MODNAME'
>>> >>  undeclared (first use in this function); did you mean
>>> 'KBUILD_BASENAME'?
>>> >>
>>> >> Full report:
>>> >>
>>> >>
>>> http://lists.infradead.org/pipermail/ath10k/2018-February/010907.html
>>> >>
>>> >> Any ideas? Is this is some unrelated issue or what? This patch is not
>>> >> even touching hif.h or ce.c.
>>> >
>>> > I didn't encountered this issue as in my defconfig only
>>> > CONFIG_ATH10K_SNOC was defined. This problem is coming when we define
>>> > CONFIG_ATH10K_SNOC and CONFIG_ATH10K_PCI simultaneously in defconfig
>>> > and this is known issue when multiple modules share objects(in this
>>> > case ce.o). I saw similar reported problem and found
>>> > https://patchwork.kernel.org/patch/10060825/.
>>> >
>>> > After picking the below change issue is not seen.
>>> 
>>> Let's ask the kbuild maintainer. Masahiro, any chances of getting 
>>> this
>>> patch applied anytime soon:
>>> 
>>> kbuild: define KBUILD_MODNAME even if multiple modules share objects
>>> 
>>> https://patchwork.kernel.org/patch/10060825/
>>> 
>>> In ath10k we would need it as otherwise we are not able to link ce.o
>>> both to ath10k_pci.ko and ath10k_snoc.ko. What do you think?
>>> 
>>> Full discussion and the ath10k patch here:
>>> 
>>> https://patchwork.kernel.org/patch/10220657/
>>> 
>> 
>> I plan to submit v2, but even if the undefined KBUILD_MODNAME is 
>> fixed,
>> I expect another problem from this patch.
>> 
>> If both CONFIG_ATH10K_PCI and CONFIG_ATH10_SNOC are 'y'
>> two instances of ce.o would be linked into vmliux,
>> then causes multiple definition error.
> 
> Oh, I didn't realise this. Thanks for pointing it out. Govind is 
> looking
> at other ways to fix this.

https://patchwork.kernel.org/patch/10298659/ is raised to address this 
problem.

Thanks,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
