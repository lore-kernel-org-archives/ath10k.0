Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRKeM-0002oC-T8
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 13:40:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: wake up offchannel queue properly
References: <1438865214-1651-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 17 Aug 2015 16:40:02 +0300
In-Reply-To: <1438865214-1651-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 6 Aug 2015 14:46:54 +0200")
Message-ID: <8737zif2z1.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Once HTT Tx queue got full offchannel queue was
> stopped and never woken up again. This broke, e.g.
> P2P. This could be reproduced after running a lot
> of traffic enough to saturate 100% of the driver
> Tx queue and then trying to send offchannel
> traffic.
>
> Fixes: 96d828d45e16 ("ath10k: rework tx queue locking")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
