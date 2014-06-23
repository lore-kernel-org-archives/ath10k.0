Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz3Qz-0000gi-N4
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 12:33:18 +0000
Message-ID: <1403526767.4418.24.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 23 Jun 2014 14:32:47 +0200
In-Reply-To: <CA+BoTQ=fpkOZXVgJt-OWdgSFX1_sO1g1E=J-7NnOb+e6a30FVA@mail.gmail.com>
 (sfid-20140623_141748_927938_88A91E9A)
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
 <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 <1403524278.4418.19.camel@jlt4.sipsolutions.net>
 <CA+BoTQ=fpkOZXVgJt-OWdgSFX1_sO1g1E=J-7NnOb+e6a30FVA@mail.gmail.com>
 (sfid-20140623_141748_927938_88A91E9A)
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, 2014-06-23 at 14:17 +0200, Michal Kazior wrote:

> > Seems like to fix it we just need to get a module reference though? Can
> > a module put() itself though? Hmmm.
> 
> It seems some drivers use module_put(THIS_MODULE) and
> __module_get(THIS_MODULE), e.g. tun/tap driver.

I don't see how this isn't racy in similar ways though?

> But does this bump up the module refcount in such a way that an
> in-progress rmmod will wait/block until the refcount reaches 0?

It should, yes, but you race once you do module_put(), no?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
