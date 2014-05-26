Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WooPy-0001Bg-8h
 for ath10k@lists.infradead.org; Mon, 26 May 2014 06:29:55 +0000
Message-ID: <1401085766.4162.3.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 26 May 2014 08:29:26 +0200
In-Reply-To: <CA+BoTQmmYJ8Mjv1=w=ZijFzZ-FB+PyEV5SKtzvVW7A8_kirueg@mail.gmail.com>
 (sfid-20140526_074857_736667_6ABB96A9)
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
 <1400850209.4358.31.camel@jlt4.sipsolutions.net>
 <CA+BoTQmmYJ8Mjv1=w=ZijFzZ-FB+PyEV5SKtzvVW7A8_kirueg@mail.gmail.com>
 (sfid-20140526_074857_736667_6ABB96A9)
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

On Mon, 2014-05-26 at 07:48 +0200, Michal Kazior wrote:
> On 23 May 2014 15:03, Johannes Berg <johannes@sipsolutions.net> wrote:
> > On Fri, 2014-05-23 at 11:06 +0200, Michal Kazior wrote:
> >
> >> There's nothing wrong with other thread holding it. Actually that's
> >> the reason for this very check.
> >>
> >> The point is to prevent ath10k_drain_tx() being called while caller
> >> (current thread) holds conf_mutex. If it were to hold conf_mutex then
> >> cancel_work_sync() can deadlock as both workers it tries to stop try
> >> to get a hold of the lock too.
> >
> > That seems pointless - lockdep would warn you about that *anyway*
> > because cancel_work_sync() and friends have proper annotations. Try it
> > sometime :)
> 
> Does it splat every time or just by chance or after a deadlock?

Whenever you execute the second path for the first time.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
