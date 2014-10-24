Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xhexk-00053Y-F8
 for ath10k@lists.infradead.org; Fri, 24 Oct 2014 13:31:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/9] ath10k: htt rx fixes and clean ups
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 24 Oct 2014 16:30:57 +0300
In-Reply-To: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 20 Oct 2014 15:40:29 +0200")
Message-ID: <8738adoar2.fsf@kamboji.qca.qualcomm.com>
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

> I've found a couple of issues while reworking rx
> path.
>
>
> Michal Kazior (9):
>   ath10k: don't drop control and null func Rx
>   ath10k: remove unused variable
>   ath10k: use ieee80211 defines for crypto param lengths
>   ath10k: fix rx buffer tracing
>   ath10k: deduplicate htt rx dma unmapping
>   ath10k: don't drop frames aggressively
>   ath10k: add extra sanity check when popping amsdu
>   ath10k: don't forget to replenish after fragmented Rx
>   ath10k: clear htt->rx_confused on load

Thanks, all nine applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
