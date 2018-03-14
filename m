Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew35i-0007A8-Dn
 for ath10k@lists.infradead.org; Wed, 14 Mar 2018 09:53:04 +0000
MIME-Version: 1.0
Subject: Re: ath10k: dma unmap mgmt tx buffer if wmi cmd send fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1518169330-4934-1-git-send-email-pillair@codeaurora.org>
References: <1518169330-4934-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20180314095250.E273360592@smtp.codeaurora.org>
Date: Wed, 14 Mar 2018 09:52:50 +0000 (UTC)
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

Rakesh Pillai <pillair@codeaurora.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

38a1390e02b7 ath10k: dma unmap mgmt tx buffer if wmi cmd send fails

-- 
https://patchwork.kernel.org/patch/10208681/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
