Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz4yk-0001mI-PH
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 14:12:19 +0000
Message-ID: <1403532659.4418.30.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 23 Jun 2014 16:10:59 +0200
In-Reply-To: <CA+BoTQnvRgfObtvJcVj3np6LSRSHr_2uEfqRpOw59fuy88xnYQ@mail.gmail.com>
 (sfid-20140623_145946_117384_07F493F0)
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <1400769683.4174.25.camel@jlt4.sipsolutions.net>
 <CA+BoTQk=DU=-HzVo-XsQTpCt6CS7aXxQMy5hTyQ7qC56ebBLZQ@mail.gmail.com>
 <1403524278.4418.19.camel@jlt4.sipsolutions.net>
 <CA+BoTQ=fpkOZXVgJt-OWdgSFX1_sO1g1E=J-7NnOb+e6a30FVA@mail.gmail.com>
 <1403526767.4418.24.camel@jlt4.sipsolutions.net>
 <CA+BoTQnvRgfObtvJcVj3np6LSRSHr_2uEfqRpOw59fuy88xnYQ@mail.gmail.com>
 (sfid-20140623_145946_117384_07F493F0)
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

On Mon, 2014-06-23 at 14:59 +0200, Michal Kazior wrote:
> >> But does this bump up the module refcount in such a way that an
> >> in-progress rmmod will wait/block until the refcount reaches 0?
> >
> > It should, yes, but you race once you do module_put(), no?
> 
> It's still racy, I agree.
> 
> I don't see how device_release_driver() can be made work synchronously
> at all. It should, however, be perfectly fine if this was an async
> request to release a device/driver, right?

Yeah, but the work struct would have to live somewhere that can't be
unloaded, or can more safely wait for it...

I guess we could also have a list of these in the modules and
synchronize on them in module_exit()?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
