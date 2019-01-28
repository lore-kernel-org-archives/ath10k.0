Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnyrc-0002YK-46
 for ath10k@lists.infradead.org; Mon, 28 Jan 2019 04:49:41 +0000
MIME-Version: 1.0
Date: Mon, 28 Jan 2019 10:19:37 +0530
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
In-Reply-To: <69a99a7f1b2b7434b70c5c6df1812952928547cc.camel@sipsolutions.net>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
 <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
 <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
 <c9b16303e344b2dcd4d52cf9c0830846@codeaurora.org>
 <69a99a7f1b2b7434b70c5c6df1812952928547cc.camel@sipsolutions.net>
Message-ID: <7212e3a5157ab61d10b8d7184e290593@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-01-26 02:19, Johannes Berg wrote:
> 
> Sure. I guess my question was intended more along the lines of "how 
> much
> CPU impact would you be able to live with?" :-)

As much as no CPU impact.

> At the same time, what happens today actually? Do all frames from non-
> associated clients come up to the host? If so, is this not a problem 
> for
> all APs, not just ath10k?
> 

Today, without this patch. No frames from non-associated clients come up 
to the host in AP mode.

> And if they don't come up, what feature requires this? Sorry for the
> vague questions, but I'm not really sure what this is all about. If
> there's a need for these frames, wouldn't we need a generic way of
> enabling receiving them, and perhaps even signalling hostapd with them?

Steering application use this feature in their logical part of client 
steering.

This feature allow an application to configure filtering rules to 
capture from
stations that are active on the operating channel but not associated to 
this AP.
It also allow to get the statistics information of the configured non 
associated stations.

Ath10k driver use HW filter to capture other BSS frames and drop these 
packets
after collecting statistics information of configured non associated 
stations.

QCA vendor command/attr details:
https://w1.fi/cgit/hostap/commit/?id=6b21df0bb7a261ef890a02d1fef95ffa5ff54cfc


> Also, what are the statistics and what do you intend to use them for?

In this patch, we are providing the below information as a statistics of 
non associated stations.

- MAC address
- Last received signal strength
- Time stamp of the last received signal strength

Thanks,
Karthikeyan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
