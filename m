Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1er1S9-0006Ls-7p
 for ath10k@lists.infradead.org; Wed, 28 Feb 2018 13:07:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: dma unmap mgmt tx buffer if wmi cmd send fails
References: <1518169330-4934-1-git-send-email-pillair@codeaurora.org>
Date: Wed, 28 Feb 2018 15:07:09 +0200
In-Reply-To: <1518169330-4934-1-git-send-email-pillair@codeaurora.org>
 (pillair@codeaurora.org's message of "Fri, 9 Feb 2018 15:12:10 +0530")
Message-ID: <87bmg9s1oi.fsf@kamboji.qca.qualcomm.com>
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
To: pillair@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

pillair@codeaurora.org writes:

> From: Rakesh Pillai <pillair@codeaurora.org>
>
> WCN3990 sends mgmt frames by reference via WMI.
> The host dma maps the mgmt frame and sends the physical
> address to the firmware in the wmi command. Since the
> dma mapping is done in the gen_mgmt_tx and if the wmi
> command send fails, the corresponding mgmt frame is
> not being dma unmapped.
>
> Fix the missing dma unmapping of mgmt tx frame when
> wmi command sending fails for mgmt tx by reference
> via WMI. The already exisiting mgmt tx using copy by
> value does not need such dma unmapping.
> Add a separate wmi-tlv op for mgmt tx via ref, which
> takes care of unmapping the dma address, in case of
> wmi command sending failure.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

ath10k-check found two warnings, I fixed those in pending branch:

drivers/net/wireless/ath/ath10k/wmi-ops.h:130: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/wmi-ops.h:380: Alignment should match open parenthesis

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
