Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD3gv-0007do-VV
 for ath10k@lists.infradead.org; Thu, 18 Oct 2018 08:30:05 +0000
Message-ID: <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 18 Oct 2018 10:29:32 +0200
In-Reply-To: <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
 <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Fri, 2018-10-05 at 06:00 +0000, Kalle Valo wrote:
> 
> So I'm not sure what to do with this. A bpf type of filtering system in
> mac80211 would be nice

Yes, I think we really need to start implementing that sooner rather
than later. I had something, must see if I can find time for it.

> but then again we cannot benefit from HW offloading.

Yes, that's a concern. But how big of a concern is it really?

This patch only talks about "allow an AP" etc. and so while important,
power isn't the _utmost_ concern like on mobile. Given an efficient
filtering solution in software, would that be sufficient?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
