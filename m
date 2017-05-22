Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCgZD-0006pF-0o
 for ath10k@lists.infradead.org; Mon, 22 May 2017 06:11:45 +0000
Message-ID: <1495433473.2653.0.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k : Fix channel survey dump
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 22 May 2017 08:11:13 +0200
In-Reply-To: <CAJ-Vmok6UXVpYfK5c_tDnFGN1uLfx+sGp0W2zFppB=TYtax72g@mail.gmail.com>
 (sfid-20170519_173300_356433_4FB5D671)
References: <1493217698-22451-1-git-send-email-c_vnaral@qti.qualcomm.com>
 <40f2b7a2-7276-6de6-afc6-407348c92e70@nbd.name>
 <87wp9durwe.fsf@kamboji.qca.qualcomm.com>
 <CAJ-Vmok6UXVpYfK5c_tDnFGN1uLfx+sGp0W2zFppB=TYtax72g@mail.gmail.com>
 (sfid-20170519_173300_356433_4FB5D671)
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
To: Adrian Chadd <adrian@freebsd.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Venkateswara Naralasettty <vnaralas@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

On Fri, 2017-05-19 at 08:32 -0700, Adrian Chadd wrote:
> 
> I just bumped into this at work. I'm thinking of teaching mac80211
> about optionally summing things so each driver doesn't need another
> per-channel array.
> 

We could possibly even do that in cfg80211, I guess.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
