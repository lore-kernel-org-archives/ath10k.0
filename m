Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTcSA-0002BA-KF
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 18:56:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix station authorization
References: <1380875428-20899-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 8 Oct 2013 21:55:52 +0300
In-Reply-To: <1380875428-20899-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Oct 2013 10:30:28 +0200")
Message-ID: <8761t7sibr.fsf@kamboji.qca.qualcomm.com>
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

> Peer authorization should be delayed until
> mac80211 says given station has transitioned into
> authorized state.
>
> The state is propagated from mac80211 for both
> open and protected networks.
>
> This should prevent data traffic to/from given
> station until authorization completes. Until now
> it was probably possible for unauthorized traffic
> to pass leading to possible security issues.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
