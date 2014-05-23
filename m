Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnp8s-0004Lw-M6
 for ath10k@lists.infradead.org; Fri, 23 May 2014 13:04:14 +0000
Message-ID: <1400850209.4358.31.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 23 May 2014 15:03:29 +0200
In-Reply-To: <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
 (sfid-20140523_110633_993738_661A8280)
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
 (sfid-20140523_110633_993738_661A8280)
Mime-Version: 1.0
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, 2014-05-23 at 11:06 +0200, Michal Kazior wrote:

> There's nothing wrong with other thread holding it. Actually that's
> the reason for this very check.
> 
> The point is to prevent ath10k_drain_tx() being called while caller
> (current thread) holds conf_mutex. If it were to hold conf_mutex then
> cancel_work_sync() can deadlock as both workers it tries to stop try
> to get a hold of the lock too.

That seems pointless - lockdep would warn you about that *anyway*
because cancel_work_sync() and friends have proper annotations. Try it
sometime :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
