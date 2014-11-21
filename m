Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrlsq-0004yk-JQ
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 10:56:13 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21615.6810.716982.963365@gargle.gargle.HOWL>
Date: Fri, 21 Nov 2014 16:27:30 +0530
Subject: Re: [RFC] ath10k: Fix shared WEP
In-Reply-To: <CA+BoTQk2fy024b5E=khSrzpUGzCL=jU_4wpxJ0AAyxmsFZuWhA@mail.gmail.com>
References: <1416492382-18058-1-git-send-email-sujith@msujith.org>
 <CA+BoTQnyf0tvg8ngLqsoux-A9-3J46cDuJdd-V=kS24wWS4Y1A@mail.gmail.com>
 <21615.3019.437408.992893@gargle.gargle.HOWL>
 <CA+BoTQm_X3-kpJanZu=dJ3LDPqjAfnUoyBwqzgYGX3bK+H1f2g@mail.gmail.com>
 <21615.5541.120044.376524@gargle.gargle.HOWL>
 <CA+BoTQk2fy024b5E=khSrzpUGzCL=jU_4wpxJ0AAyxmsFZuWhA@mail.gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior wrote:
> Yes. Basically peer->keys[] should be protected by both conf_mutex and
> data_lock if you want to modify it. If you want to read it you need
> either one.

Ok.

> Thanks! Looks like the `cancel_work_sync(&arvif->wep_key_work);`
> should go _before_ `mutex_lock(&ar->conf_mutex);`.
> 
> I'm busy with some stuff so feel free to send a patch :-)

I'll send a fix after this one. Thanks for the review !

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
