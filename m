Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0swM-0004EG-0T
 for ath10k@lists.infradead.org; Mon, 23 Nov 2015 15:22:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/9] ath10k: clean up ath10k_skb_cb
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 23 Nov 2015 17:21:26 +0200
In-Reply-To: <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 18 Nov 2015 06:59:14 +0100")
Message-ID: <878u5ospvt.fsf@kamboji.qca.qualcomm.com>
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

> The ath10k_skb_cb structure wasn't really space
> efficient. Some stuff is removed or replaced with
> more compact representation.
>
> This cleanup is necessary for future features.
>
> The size of ath10k_skb_cb:
>
>           before   after
>  x86-32   26       12
>  x86-64   34       20
>
>
> v3:
>  * rebase
>
> v2:
>  * fix a bug (patch 7/9 introduced)
>
>
> Michal Kazior (9):
>   ath10k: merge is_protected with nohwcrypt
>   ath10k: rename function to adhere to naming convention
>   ath10k: remove txmode from skb_cb
>   ath10k: remove is_offchan
>   ath10k: remove freq from skb_cb
>   ath10k: pack up flags in skb_cb
>   ath10k: fix tx header parsing
>   ath10k: replace vdev_id and tid in skb cb
>   ath10k: store msdu_id instead of txbuf pointers

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
