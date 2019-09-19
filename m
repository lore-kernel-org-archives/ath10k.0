Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAkBz-0001iK-Rv
 for ath10k@lists.infradead.org; Thu, 19 Sep 2019 00:21:05 +0000
Received: by mail-io1-xd42.google.com with SMTP id m11so3625020ioo.0
 for <ath10k@lists.infradead.org>; Wed, 18 Sep 2019 17:21:03 -0700 (PDT)
Date: Wed, 18 Sep 2019 20:21:00 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH v4 3/3] ath10k: add support for controlling tx power to a
 station
Message-ID: <20190919002100.GA28186@localhost>
References: <1553856587-21611-1-git-send-email-bpothuno@codeaurora.org>
 <20190402223709.GB8910@localhost>
 <871rwdbu1p.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rwdbu1p.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Sep 18, 2019 at 04:41:54PM +0300, Kalle Valo wrote:
> Bob Copeland <me@bobcopeland.com> writes:
> > - on A, changed the global tx power limit to 1 dBm
> >   -> result: signal level dropped to ~ -95 dBm
> >
> > Reading the description above, now I'm wondering if the txpower is
> > max(sta-power,global-power)?  If so, that seems a bit unintuitive to me,
> > or at least isn't what I hoped for.  I'd prefer to have per-sta power
> > setting override the global power.
> 
> Balaji, please reply to Bob's questions. I missed this thread while
> applying v5, sorry Bob.

Just to follow-up, I ran more experiments since writing the above
email and it didn't look like it was doing max() either -- at least
on my hardware/firmware combo it had no effect at all that I could tell.

I did verify that the wmi update went through to the firmware.

I can't remember now, but I may have been testing mesh mode in case
that makes a difference.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
