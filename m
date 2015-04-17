Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YizsY-0002mW-6g
 for ath10k@lists.infradead.org; Fri, 17 Apr 2015 06:35:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: change static wep key handling for client mode
References: <1428671158-8159-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 17 Apr 2015 09:35:23 +0300
In-Reply-To: <1428671158-8159-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Apr 2015 13:05:58 +0000")
Message-ID: <87mw2745zo.fsf@kamboji.qca.qualcomm.com>
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

> mac80211 sets static WEP keys as groupwise while
> firmware requires them to be installed twice as
> both pairwise and groupwise.
>
> Until now these keys were installed once as
> pairwise only and, due to that special handling,
> needed additional tricks to support 802.1x as
> well.
>
> Without this patch in some cases (when AP and
> ath10k client use different default tx keys)
> multicast communication was broken.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
