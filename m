Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkTAf-0004LQ-1q
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 08:36:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: optimize ce_lock on post rx buffer processing
References: <1444047778-22900-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Fri, 9 Oct 2015 11:36:23 +0300
In-Reply-To: <1444047778-22900-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Mon, 5 Oct 2015 17:52:58 +0530")
Message-ID: <87h9m0sak8.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> After processing received packets from copy engine, host will allocate
> new buffer and queue them back to copy engine ring for further
> packet reception. On post rx processing path, skb allocation and
> dma mapping are unnecessarily handled within ce_lock. This is affecting
> peak throughput and also causing more CPU consumption. Optimize this
> by acquiring ce_lock only when accessing copy engine ring and moving
> skb allocation out of ce_lock.
>
> In AP148 platform with QCA99x0 in conducted environment, UDP uplink peak
> throughput is improved from ~1320 Mbps to ~1450 Mbps and TCP uplink peak
> throughput is increased from ~1240 Mbps (70% host CPU load) to ~1300 Mbps
> (71% CPU load). Similarly ~40Mbps improvement is observed in downlink
> path.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
