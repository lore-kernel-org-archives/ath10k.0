Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKbE-0002Hg-G3
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 12:08:32 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix throughput regression in multi client mode
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160829081613.1474-1-rmanohar@qti.qualcomm.com>
Message-ID: <00fa6b69d3a645b19d85f2f3c83748b5@euamsexm01a.eu.qualcomm.com>
Date: Fri, 9 Sep 2016 14:07:34 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> commit 7a0adc83f34d ("ath10k: improve tx scheduling") is causing
> severe throughput drop in multi client mode. This issue is originally
> reported in veriwave setup with 50 clients with TCP downlink traffic.
> While increasing number of clients, the average throughput drops
> gradually. With 50 clients, the combined peak throughput is decreased
> to 98 Mbps whereas reverting given commit restored it to 550 Mbps.
> 
> Processing txqs for every tx completion is causing overhead. Ideally for
> management frame tx completion, pending txqs processing can be avoided.
> The change partly reverts the commit "ath10k: improve tx scheduling".
> Processing pending txqs after all skbs tx completion will yeild enough
> room to burst tx frames.
> 
> Fixes: 7a0adc83f34d ("ath10k: improve tx scheduling")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

18f53fe0f303 ath10k: fix throughput regression in multi client mode

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9303279/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
