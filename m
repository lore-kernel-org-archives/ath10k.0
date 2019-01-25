Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn220-0005lm-Ar
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 14:00:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix dma unmap direction for management frames
References: <1548390066-12305-1-git-send-email-pillair@codeaurora.org>
Date: Fri, 25 Jan 2019 16:00:23 +0200
In-Reply-To: <1548390066-12305-1-git-send-email-pillair@codeaurora.org>
 (Rakesh Pillai's message of "Fri, 25 Jan 2019 09:51:06 +0530")
Message-ID: <87o9843ki0.fsf@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> writes:

> The management frames transmitted are dma mapped with
> direction TO_DEVICE, but incorrectly mapped with
> direction FROM_DEVICE during tx complete and error cases.
>
> Fix the direction of dma during dma unmap of the
> transmitted management frames.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>
> Fixes: 38a1390e02b7

This should be:

Fixes: 38a1390e02b7 ("ath10k: dma unmap mgmt tx buffer if wmi cmd send fails")

I'll fix that in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
