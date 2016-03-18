Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agpBi-0003R7-Fz
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 07:51:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: handle channel change htt event
Date: Fri, 18 Mar 2016 07:50:43 +0000
Message-ID: <87io0ki5rh.fsf@kamboji.qca.qualcomm.com>
References: <1457458043-9593-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1457458043-9593-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Tue, 8 Mar 2016 22:57:23 +0530")
Content-Language: en-US
Content-ID: <B7E5350441004849989C6CAF808419D3@qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Whenever firmware is configuring operating channel during scan or
> home channel, channel change event will be indicated to host. In some
> cases (device probe/ last vdev down), target will be configured to
> default channel whereas host is unaware of target's operating channel.
> This leads to packet drop due to unknown channel and kernel log will be
> filled up with "no channel configured; ignoring frame(s)!". Fix that
> by handling HTT_T2H_MSG_TYPE_CHAN_CHANGE event.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
