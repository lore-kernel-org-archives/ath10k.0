Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpCkj-0006jT-Rp
 for ath10k@lists.infradead.org; Thu, 31 Jan 2019 13:51:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Set DMA address mask to 35 bit for WCN3990
References: <1535992622-5074-1-git-send-email-pillair@codeaurora.org>
 <20190130185721.GT31919@minitux>
Date: Thu, 31 Jan 2019 15:51:30 +0200
In-Reply-To: <20190130185721.GT31919@minitux> (Bjorn Andersson's message of
 "Wed, 30 Jan 2019 10:57:22 -0800")
Message-ID: <871s4tj5p9.fsf@kamboji.qca.qualcomm.com>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Mon 03 Sep 09:37 PDT 2018, Rakesh Pillai wrote:
>
>> WCN3990 is a 37-bit target but can address memory range
>> only upto 35 bits. The 36th bit is used to control the
>> smmu/iommu translation and the 37th bit is used by the
>> internal bus masters to access the wifi subsystem internal
>> SRAM. With the DMA mask set to 37i-bit, the host driver
>> can get 37-bit dma address, which leads to incorrect
>> address access in the target.
>> 
>> Hence the host driver can used addresses upto 35-bit
>> for WCN3990. Fix the dma mask for wcn3990 to 35-bit,
>> instead of 37-bit.
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>> 
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>
> This solves the problem I'm seeing on my SDM845, where I see a
> translation fault on a 32-bit address from the IOMMU, which we
> previously mapped the 36 bit version of (my dma-ranges is set to 36
> bits).
>
> So:
>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the reminder. This got piled up in my deferred queue in
patchwork and I hadn't looked at it yet. I'll queue this for -next.

> However, some of the changes in this patch and the fact that I get a
> translation error on the lower 32 bits of the mapped iova, makes me
> suspect that while the hardware is capable of 37 bits, the driver only
> dealt with the lower 32.  And if that's the case I would like to see
> that mentioned in the commit message.

Rakesh mentioned that it's actually 35 bits. Should something changed in
the commit log still? I can do that if needed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
