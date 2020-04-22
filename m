Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR97I-0004Re-2T
 for ath10k@lists.infradead.org; Wed, 22 Apr 2020 06:44:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v10 1/2] ath10k: add htt TX bundle for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200410061400.14231-2-wgong@codeaurora.org>
References: <20200410061400.14231-2-wgong@codeaurora.org>
Message-Id: <20200422064402.E7238C433F2@smtp.codeaurora.org>
Date: Wed, 22 Apr 2020 06:44:02 +0000 (UTC)
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

> The transmission utilization ratio for sdio bus for small packet is
> slow, because the space and time cost for sdio bus is same for large
> length packet and small length packet. So the speed of data for large
> length packet is higher than small length.
> 
> Test result of different length of data:
> 
> data packet(byte)   cost time(us)   calculated rate(Mbps)
>       256               28                73
>       512               33               124
>      1024               35               234
>      1792               45               318
>     14336              168               682
>     28672              333               688
>     57344              660               695
> 
> This patch change the TX packet from single packet to a large length
> bundle packet, max size is 32, it results in significant performance
> improvement on TX path.
> 
> Also there's a fourth thread "ath10k_tx_complete_wq" added to ath10k as it
> improves TCP RX throughput (values in Mbps):
> 
>                                        TCP-RX    TCP-TX    UDP-RX      UDP-TX
> use workqueue_tx_complete              423       357       448         412
> change it to ar->workqueue             410       360       449         414
> change it to ar->workqueue_aux         405       339       446         401
> 
> This patch only effect sdio chip, it will not effect PCI, SNOC etc.
> It only enable bundle for sdio chip.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

c8334512f3dd ath10k: add htt TX bundle for sdio
2f918ea98606 ath10k: enable alt data of TX path for sdio

-- 
https://patchwork.kernel.org/patch/11482769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
