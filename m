Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCvE-0004ml-GS
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 11:52:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: correct the tlv len of
 ath10k_wmi_tlv_op_gen_config_pno_start
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191107093031.24131-1-wgong@codeaurora.org>
References: <20191107093031.24131-1-wgong@codeaurora.org>
Message-ID: <0101016ea2683bf1-d3eb71cd-3511-4c90-a46a-f6e42d02656f-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 11:52:50 +0000
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> the tlv len is set to the total len of the wmi cmd, it will trigger
> firmware crash, correct the tlv len.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1 and QCA6174
> PCIE with firmware WLAN.RM.4.4.1-00110-QCARMSWPZ-1.
> 
> Fixes: ce834e280f2f875 ("ath10k: support NET_DETECT WoWLAN feature")
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e01cc82c4d1e ath10k: correct the tlv len of ath10k_wmi_tlv_op_gen_config_pno_start

-- 
https://patchwork.kernel.org/patch/11232379/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
