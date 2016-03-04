Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablK9-0007Bm-AA
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:43:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: reduce rx_lock contention for htt rx
 indication
Date: Fri, 4 Mar 2016 08:42:33 +0000
Message-ID: <871t7qzlah.fsf@kamboji.qca.qualcomm.com>
References: <1455257459-13343-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1455257459-13343-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 12 Feb 2016 11:40:58 +0530")
Content-Language: en-US
Content-ID: <C79A9C6B900AB748AA53FCE317855E2C@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Received frame indications are queued into a skb list and latest
> processed by txrx tasklet. This skb queue is protected by htt rx lock.
> Since the entire rx processing till delivering frame to mac80211 and
> replenish tasks are processed under rx_lock protection, there might be
> some delay in queuing newly received rx frame into that list on
> multicore systems. Optimize this by using skb list lock while accessing
> rx completion queue instead of htt rx lock.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Both applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
