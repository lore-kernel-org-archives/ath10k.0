Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqlg-0004Ty-Cd
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:52:37 +0000
MIME-Version: 1.0
Subject: Re: ath10k: improve wake_tx_queue ops performance
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160817153253.6615-1-rmanohar@qti.qualcomm.com>
Message-ID: <2bbb5b5df5f44598ac35860bcf353d08@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:52:08 +0200
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
> txqs_lock is interfering with wake_tx_queue submitting more frames.
> so queues don't get filled in and don't keep firmware/hardware busy
> enough. This change helps to reduce the txqs_lock contention and
> wake_tx_queue() blockage to being possible in txrx_unref().
> 
> To reduce turn around time of wake_tx_queue ops and to maintain fairness
> among all txqs, the callback is updated to push first txq alone from
> pending list for every wake_tx_queue call. Remaining txqs will be
> processed later upon tx completion.
> 
> Below improvements are observed in push-only mode and validated on
> IPQ4019 platform. With this change, in AP mode ~10Mbps increase is
> observed in downlink (AP -> STA) traffic and approx. 5-10% of CPU
> usage is reduced.
> 
> Major improvement is observed in 1-hop Mesh mode topology in 11ACVHT80.
> Compared to Infra mode, CPU overhead is higher in Mesh mode due to path
> lookup and no fast-xmit support. So reducing spin lock contention is
> helping in Mesh.
> 
>              TOT       +change
>            --------    --------
> TCP DL     545 Mbps    595 Mbps
> TCP UL     555 Mbps    585 Mbps
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

83e164b7679d ath10k: improve wake_tx_queue ops performance

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9286083/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
