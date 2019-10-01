Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFHoD-00033y-4N
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 13:03:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: restore QCA9880-AR1A (v1) detection
References: <20190906215423.23589-1-chunkeey@gmail.com>
 <20190917064412.C2E0D61572@smtp.codeaurora.org>
 <2099574.gZacamft7q@debian64>
Date: Tue, 01 Oct 2019 16:03:08 +0300
In-Reply-To: <2099574.gZacamft7q@debian64> (Christian Lamparter's message of
 "Fri, 20 Sep 2019 19:19:06 +0200")
Message-ID: <87imp84nzn.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: =?utf-8?Q?Micha=C5=82?= Kazior <kazikcz@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Christian Lamparter <chunkeey@gmail.com> writes:

> On Tuesday, September 17, 2019 8:44:12 AM CEST Kalle Valo wrote:
>> Christian Lamparter <chunkeey@gmail.com> wrote:
>> 
>> > This patch restores the old behavior that read
>> > the chip_id on the QCA988x before resetting the
>> > chip. This needs to be done in this order since
>> > the unsupported QCA988x AR1A chips fall off the
>> > bus when resetted. Otherwise the next MMIO Op
>> > after the reset causes a BUS ERROR and panic.
>> > 
>> > Cc: stable@vger.kernel.org
>> > Fixes: 1a7fecb766c8 ("ath10k: reset chip before reading chip_id in probe")
>> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>> 
>> I'll drop this as there's no plan to support QCA988X hw1.0.
>
> Kalle,
>
> I'm surprised about this. And your justification "no plan to support
> QCA988X hw1.0" seems very odd in this context, because this patch does
> not add any support for the QCA988X hw1.0.

No wonder my comment was odd, it seems I had completely misunderstood :)
I assumed this is for preparation in adding QCA988X hw1.0 support, which
is clearly wrong.

> But, I could see how the mails/replies from Tom Psyborg derailed the
> topic here. Though, I'm not sure if this is the case or not.
>
> So let set the record straight and show you the result of having that
> patch applied and load ath10k_pci with a QCA9880 v1 AR1A:
>
> [ 1491.622282] ath10k_pci 0000:00:00.0: device 003c with chip_id
> 043200ff isn't supported
>
> (System is all good!)
>
> And without the patch:
>
> [  900.320000] Data bus error, epc == 86a9a1b0, ra == 86a9a4b0

[...]

> Notice the DATA BUS Error! The router is unusable at that point and no
> longer "working".

Thanks, this clear for me now. I added this back to my queue and clarify
the commit log a bit.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
