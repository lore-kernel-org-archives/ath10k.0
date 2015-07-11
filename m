Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDxTU-00077k-Vd
 for ath10k@lists.infradead.org; Sat, 11 Jul 2015 16:18:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/6] ath10k: random fixes 2015-07-09
References: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
Date: Sat, 11 Jul 2015 19:17:34 +0300
In-Reply-To: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 9 Jul 2015 13:08:33 +0200")
Message-ID: <87a8v2wtwh.fsf@kamboji.qca.qualcomm.com>
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

> I've done most of the patches while testing P2P
> but they aren't limited to that scope.
>
> There are no inter-dependencies within the patchset
> so single patches should be easily cherry-pickable
> in case, e.g. some patches raise concerns or are
> decided to be dropped during review.
>
>
> Michal Kazior (6):
>   ath10k: don't set cck/ofdm scan flags
>   ath10k: limit multi-vif ps more aggresivelly
>   ath10k: fix hw roc expiration notifcation
>   ath10k: update vdev ps state on start
>   ath10k: fix per-vif queue locking
>   ath10k: tweak interface combinations

Thanks, all six applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
