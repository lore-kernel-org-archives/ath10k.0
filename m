Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9BSt-0008DP-Am
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:27:17 +0000
Message-ID: <1524151617.3024.25.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] ethtool: Support ETHTOOL_GSTATS2 command.
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 19 Apr 2018 17:26:57 +0200
In-Reply-To: <173c5f98-36bc-2e52-1e64-3a5f89008d46@candelatech.com>
References: <1524016176-3881-1-git-send-email-greearb@candelatech.com>
 <1524086817.3024.9.camel@sipsolutions.net>
 <f43d7ee4-7f27-b145-125e-32dbc31a27f1@candelatech.com>
 <1524119910.3024.12.camel@sipsolutions.net>
 <173c5f98-36bc-2e52-1e64-3a5f89008d46@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, 2018-04-19 at 08:25 -0700, Ben Greear wrote:
> 
> In order to efficiently parse lots of stats over and over again, I probe
> the stat names once on startup, map them to the variable I am trying to use
> (since different drivers may have different names for the same basic stat),
> and then I store the stat index.
> 
> On subsequent stat reads, I just grab stats and go right to the index to
> store the stat.
> 
> If the stats indexes change, that will complicate my logic quite a bit.

That's a good point.

> Maybe the flag could be called:  ETHTOOL_GS2_NO_REFRESH_FW ?

Sounds more to the point to me, yeah.

> > 
> > Also, wrt. the rest of the patch, I'd argue that it'd be worthwhile to
> > write the spatch and just add the flags argument to "get_ethtool_stats"
> > instead of adding a separate method - internally to the kernel it's not
> > that hard to change.
> 
> Maybe this could be in followup patches?  It's going to touch a lot of files,
> and might be hell to get merged all at once, and I've never used spatch, so
> just maybe someone else will volunteer that part :)

I guess you'll have to ask davem. :)

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
