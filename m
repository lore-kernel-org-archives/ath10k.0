Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAhXA-000788-2F
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 21:30:45 +0000
Received: by mail-oi1-x244.google.com with SMTP id i185so877643oif.9
 for <ath10k@lists.infradead.org>; Wed, 18 Sep 2019 14:30:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20190917064412.E237C61577@smtp.codeaurora.org>
References: <20190906215423.23589-1-chunkeey@gmail.com>
 <20190917064412.E237C61577@smtp.codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 18 Sep 2019 23:30:42 +0200
Message-ID: <CAKR_QVJ09gsbvvutDjDU4tR3VdkQRyYveCnAZ-gU9qByERb-=g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: restore QCA9880-AR1A (v1) detection
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Christian Lamparter <chunkeey@gmail.com>

On 17/09/2019, Kalle Valo <kvalo@codeaurora.org> wrote:
> Christian Lamparter <chunkeey@gmail.com> wrote:
>
>> This patch restores the old behavior that read
>> the chip_id on the QCA988x before resetting the
>> chip. This needs to be done in this order since
>> the unsupported QCA988x AR1A chips fall off the
>> bus when resetted. Otherwise the next MMIO Op
>> after the reset causes a BUS ERROR and panic.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a7fecb766c8 ("ath10k: reset chip before reading chip_id in
>> probe")
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>
> I'll drop this as there's no plan to support QCA988X hw1.0.
>
> --
> https://patchwork.kernel.org/patch/11136089/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
>

Maybe the whole subject on QCA988X cards should be re-evaluated? Since
at this point it's not for certain whether the card is difficult to
support or whether it is damaged.
There was at least one report of QCA988X hw2.0 failing in an identical
way as QCA988X hw1.0. In case it turns out to be hw damage, a fallback
driver mechanism could provide extended lifetime for these cards. A
link to the hw2.0 failure:
https://forum.openwrt.org/t/is-it-possible-to-brick-the-wireless-card-qca988x-irreversibly/32615

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
