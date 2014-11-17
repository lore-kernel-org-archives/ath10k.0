Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNSd-0006W6-0B
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:39:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: handle ieee80211 header and payload tracing
 separately
References: <1415195071-30250-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 17 Nov 2014 16:38:52 +0200
In-Reply-To: <1415195071-30250-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 5 Nov 2014 19:14:31 +0530")
Message-ID: <87egt1q4cj.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> For packet log, the transmitted frame 802.11 header alone is sufficient.
> Recording entire packet is also consuming lot of disk space. To optimize
> this, tx and rx data tracepoints are splitted into header and payload
> tracepoints.
>
> To record tx ieee80211 headers
>
>      trace-cmd record -e ath10k_tx_hdr
>
> To record complete packets
>
>      trace-cmd record -e ath10k_tx_hdr -e ath10k_tx_payload
>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
