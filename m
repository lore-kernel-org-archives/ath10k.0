Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePVJE-0004rV-Tg
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 15:20:39 +0000
MIME-Version: 1.0
Subject: Re: ath10k: handling qos at STA side based on AP WMM enable/disable
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1511863650-9419-1-git-send-email-bpothuno@qti.qualcomm.com>
References: <1511863650-9419-1-git-send-email-bpothuno@qti.qualcomm.com>
Message-ID: <da2cd6fa88db42ab94207e5551c9be69@euamsexm01a.eu.qualcomm.com>
Date: Thu, 14 Dec 2017 16:19:41 +0100
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
To: bpothuno@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

bpothuno@qti.qualcomm.com wrote:

> Data packets are not sent by STA in case of STA joined to
> non QOS AP (WMM disabled AP). This is happening because of STA
> is sending data packets to firmware from host with qos enabled
> along with non qos queue value(TID = 16).
> Due to qos enabled, firmware is discarding the packet.
> 
> This patch fixes this issue by updating the qos based on station
> WME capability field if WMM is disabled in AP.
> 
> This patch is required by 10.4 family chipsets like
> QCA4019/QCA9888/QCA9884/QCA99X0.
> Firmware Versoin : 10.4-3.5.1-00018.
> 
> For 10.2.4 family chipsets QCA988X/QCA9887 and QCA6174 this patch
> has no effect.
> 
> Signed-off-by: Balaji Pothunoori <bpothuno@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

07ffb4497360 ath10k: handling qos at STA side based on AP WMM enable/disable

-- 
https://patchwork.kernel.org/patch/10079089/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
