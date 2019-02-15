Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guckg-0000Xa-8O
 for ath10k@lists.infradead.org; Fri, 15 Feb 2019 12:38:00 +0000
Message-ID: <dd920f575478bee3cc071765c9e848e3d2dfffab.camel@sipsolutions.net>
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 15 Feb 2019 13:37:49 +0100
In-Reply-To: <7212e3a5157ab61d10b8d7184e290593@codeaurora.org>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
 <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
 <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
 <c9b16303e344b2dcd4d52cf9c0830846@codeaurora.org>
 <69a99a7f1b2b7434b70c5c6df1812952928547cc.camel@sipsolutions.net>
 <7212e3a5157ab61d10b8d7184e290593@codeaurora.org>
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

On Mon, 2019-01-28 at 10:19 +0530, Karthikeyan Periyasamy wrote:

> > At the same time, what happens today actually? Do all frames from non-
> > associated clients come up to the host? If so, is this not a problem 
> > for all APs, not just ath10k?
> 
> Today, without this patch. No frames from non-associated clients come up 
> to the host in AP mode.

So it's not just _filtering_ but also enabling to see them, right?

> > And if they don't come up, what feature requires this? Sorry for the
> > vague questions, but I'm not really sure what this is all about. If
> > there's a need for these frames, wouldn't we need a generic way of
> > enabling receiving them, and perhaps even signalling hostapd with them?
> 
> Steering application use this feature in their logical part of client 
> steering.

But there aren't even any steering applications that are open source or
anything like that, right?

I don't see why we should include this upstream. Clearly you can use
this for whatever you like to do with your driver in non-upstream
builds, and you can open-source this code, but if there are no
applications that could possibly use it upstream why bother?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
