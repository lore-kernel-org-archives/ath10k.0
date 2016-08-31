Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf0pB-0006H1-Jf
 for ath10k@lists.infradead.org; Wed, 31 Aug 2016 08:24:50 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix throughput regression in multi client mode
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160829081613.1474-1-rmanohar@qti.qualcomm.com>
Message-ID: <425ad8d804bf46feada839a8e0d0c77e@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 Aug 2016 10:24:15 +0200
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

I'm planning to queue this to 4.8 if no objections.

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9303279/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
