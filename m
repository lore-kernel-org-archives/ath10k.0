Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFhsr-0006WM-Ai
 for ath10k@lists.infradead.org; Tue, 30 May 2017 14:12:31 +0000
Message-ID: <1496153526.3327.12.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: manage RX BA session offload without SKB queue
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 30 May 2017 16:12:06 +0200
In-Reply-To: <20170530141059.28006-1-johannes@sipsolutions.net>
 (sfid-20170530_161107_071358_D610DE8E)
References: <20170530141059.28006-1-johannes@sipsolutions.net>
 (sfid-20170530_161107_071358_D610DE8E)
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
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?Q?Micha=C5=82?= Kazior <kazikcz@gmail.com>, ath10k@lists.infradead.org

On Tue, 2017-05-30 at 16:10 +0200, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> Instead of using the SKB queue with the fake pkt_type for the
> offloaded RX BA session management, also handle this with the
> normal aggregation state machine worker. This also makes the
> use of this more reliable since it gets rid of the allocation
> of the fake skb.
> 
> Combined with the previous patch, this finally allows us to
> get rid of the pkt_type hack entirely, so do that as well.

Previous patch is this:

https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211.git/commit/?id=7a7c0a6438b8e7636d5a22e572892cc234f68297

I can't test this (don't have ath10k easily testable), so testing would
be appreciated.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
