Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ch3vs04.rockwellcollins.com ([205.175.226.52])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAg6K-0000z3-IO
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 18:22:10 +0000
Received: by mail-yw0-f199.google.com with SMTP id v132-v6so667033ywa.4
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 11:21:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87in8lf314.fsf@kamboji.qca.qualcomm.com>
References: <1524238793-24481-1-git-send-email-jared.bents@rockwellcollins.com>
 <87in8lf314.fsf@kamboji.qca.qualcomm.com>
From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 23 Apr 2018 13:21:54 -0500
Message-ID: <CAM=7fbeOBLMteeCxSVHzkwx5-MTiiHpudvHpiu5ydF=c33T1Fw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ath10k: convert kmemdup to dma_alloc_coherent
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,

On Sat, Apr 21, 2018 at 2:10 AM, Kalle Valo <kvalo@codeaurora.org> wrote:
> Jared Bents <jared.bents@rockwellcollins.com> writes:
>
>> Update to convert the use of kmemdup to dma_alloc_coherent as
>> dma_alloc_coherent will consider DMA region limits such as
>> those seen with CONFIG_FSL_PCI && CONFIG_ZONE_DMA32 whereas
>> kmemdup does not take those limitations into account.
>>
>> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
>
> Does this fix a real bug or is it just a theoretical issue you noticed
> while looking at the code? If this fixes a real bug please give a
> description of it.

It fixes a real bug that I have experienced.  My processor is a qoriq
T1042 powerpc and I am running the fsl-sdk-v2.0-1703 kernel (mainline
v4.1.35-rt41).  In 32 bit, the ath10k and ath9k work without issue.
After migrating to 64 bit, we experienced dma mapping errors with both
devices.  This patch is the only one that applies to a driver, the
rest of the updates performed to fix the dma mapping issues deal with
the sk_buffs are handled in skbuff, mac80211, and netlink.  We worked
with NXP to resolve the issue and I believe they will be handling the
ones that don't apply to the ath10k driver through their process.  If
we don't see them after a while, we will be sending them to the kernel
as well.

Here is the output from the dma mapping problem:

ath10k_pci 0000:01:00.0: unable to get target info from device
ath10k_pci 0000:01:00.0: could not get target info (-5)
ath10k_pci 0000:01:00.0: could not probe fw (-5)
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#guidelines
>
> --
> Kalle Valo

Jared Bents

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
