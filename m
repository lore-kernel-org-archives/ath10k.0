Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpENR-000383-Lh
 for ath10k@lists.infradead.org; Thu, 31 Jan 2019 15:35:43 +0000
Received: by mail-pl1-x642.google.com with SMTP id e11so1619130plt.11
 for <ath10k@lists.infradead.org>; Thu, 31 Jan 2019 07:35:41 -0800 (PST)
Date: Thu, 31 Jan 2019 07:35:37 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] ath10k: Set DMA address mask to 35 bit for WCN3990
Message-ID: <20190131153537.GC2387@tuxbook-pro>
References: <1535992622-5074-1-git-send-email-pillair@codeaurora.org>
 <20190130185721.GT31919@minitux>
 <871s4tj5p9.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871s4tj5p9.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

On Thu 31 Jan 05:51 PST 2019, Kalle Valo wrote:

> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> 
> > On Mon 03 Sep 09:37 PDT 2018, Rakesh Pillai wrote:
> >
> >> WCN3990 is a 37-bit target but can address memory range
> >> only upto 35 bits. The 36th bit is used to control the
> >> smmu/iommu translation and the 37th bit is used by the
> >> internal bus masters to access the wifi subsystem internal
> >> SRAM. With the DMA mask set to 37i-bit, the host driver
> >> can get 37-bit dma address, which leads to incorrect
> >> address access in the target.
> >> 
> >> Hence the host driver can used addresses upto 35-bit
> >> for WCN3990. Fix the dma mask for wcn3990 to 35-bit,
> >> instead of 37-bit.
> >> 
> >> Tested HW: WCN3990
> >> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> >> 
> >> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> >
> > This solves the problem I'm seeing on my SDM845, where I see a
> > translation fault on a 32-bit address from the IOMMU, which we
> > previously mapped the 36 bit version of (my dma-ranges is set to 36
> > bits).
> >
> > So:
> >
> > Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Thanks for the reminder. This got piled up in my deferred queue in
> patchwork and I hadn't looked at it yet. I'll queue this for -next.
> 

Thanks

> > However, some of the changes in this patch and the fact that I get a
> > translation error on the lower 32 bits of the mapped iova, makes me
> > suspect that while the hardware is capable of 37 bits, the driver only
> > dealt with the lower 32.  And if that's the case I would like to see
> > that mentioned in the commit message.
> 
> Rakesh mentioned that it's actually 35 bits. Should something changed in
> the commit log still? I can do that if needed.
> 

Right, so the patch and commit message matches. What I'm asking about is
that in my testing I saw, from the IOMMU translation errors, that the
addresses accessed by the hardware wasn't 35 bit, they where only 32
bits.

Given that the patch also makes changes to how it writes addresses to
the ring I was wondering if the patch actually takes the limit from 32
to 35, not 37 to 35.


Regardless, I'm fine with the end result, you have my T-b and I would be
happy to see this in v5.1.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
