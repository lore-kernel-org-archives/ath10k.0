Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn8Pp-0007Ms-3K
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 20:49:30 +0000
Message-ID: <69a99a7f1b2b7434b70c5c6df1812952928547cc.camel@sipsolutions.net>
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 25 Jan 2019 21:49:26 +0100
In-Reply-To: <c9b16303e344b2dcd4d52cf9c0830846@codeaurora.org>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
 <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
 <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
 <c9b16303e344b2dcd4d52cf9c0830846@codeaurora.org>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Tue, 2018-11-20 at 08:10 +0530, Karthikeyan Periyasamy wrote:

> > This patch only talks about "allow an AP" etc. and so while important,
> > power isn't the _utmost_ concern like on mobile. Given an efficient
> > filtering solution in software, would that be sufficient?
> 
> Assume in a scenario where there are multiple APs (One Center AP and 
> Multiple repeater AP) in same operating channel.
> Clients present in Neighbor APs causing higher traffic.
> 
> when we try to filter desire client packets,
> In HW offload case, all Neighbor BSS packets are filtered by HW. so 
> there is no impact in CPU load. AP performance not get impacted.
> In bpf (enabling monitor mode) case, all Neighbor BSS packets get 
> filtered by software. It will consume CPU load which will impact AP 
> performance.
> 
> Irrespective of how many neighbor APs present in the topology, HW 
> offload take care of neighbor BSS filtering. Hence no impact in CPU 
> load.
> so we decided to use HW offload. To use our HW offload feature, we ended 
> up in vendor command approach.

Sure. I guess my question was intended more along the lines of "how much
CPU impact would you be able to live with?" :-)

At the same time, what happens today actually? Do all frames from non-
associated clients come up to the host? If so, is this not a problem for
all APs, not just ath10k?

And if they don't come up, what feature requires this? Sorry for the
vague questions, but I'm not really sure what this is all about. If
there's a need for these frames, wouldn't we need a generic way of
enabling receiving them, and perhaps even signalling hostapd with them?

Also, what are the statistics and what do you intend to use them for?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
