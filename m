Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRKjQ-0004lT-2k
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 13:45:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: wake up queue upon vif creation
References: <1438931301-27081-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 17 Aug 2015 16:45:08 +0300
In-Reply-To: <1438931301-27081-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 7 Aug 2015 09:08:21 +0200")
Message-ID: <87y4hado63.fsf@kamboji.qca.qualcomm.com>
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

> Vif's vdev_id is used as queue number. However due
> to the tx pausing design in ath10k it was possible
> for a new interface to be created with its tx
> queue stopped (via ieee80211_stop_queues). This
> could in turn leave the interface inoperable until
> ath10k_mac_tx_unlock() was called.
>
> This problem only affected multi-vif scenarios when
> new interfaces were created some time later after
> other interfaces have been running for some time
> and had Tx queue full at some point prior.
>
> Possible manifestation of the bug was
> authentication timeout for a client vif.
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
