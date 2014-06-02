Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrWeG-0002wR-8R
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 18:07:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove unnecessary htt rx corruption check
References: <1401357008-16259-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 2 Jun 2014 21:07:13 +0300
In-Reply-To: <1401357008-16259-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 29 May 2014 11:50:08 +0200")
Message-ID: <87sinnxk1a.fsf@kamboji.qca.qualcomm.com>
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

> While fixing a bug reported by Avery I went ahead
> and added a warning suspecting there might be
> something more to the bug. This ended up with
> people reporting they see warnings during heavy
> traffic. This bought me some time and helped me
> understand the problem better - apparently fw/hw
> can report a chained msdus as follows: 1 msdu, 1
> chained, 1 msdu (0 length).
>
> The patch removes the extra check but leaves the
> other change that fixed the original skb_push
> panic bug (msdu_chaining was overwritten in an
> unfortunate way which made the above example to
> be treated as non-chained case).
>
> Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied to ath-current branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
