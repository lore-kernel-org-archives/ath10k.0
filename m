Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDDLu-0003r9-0a
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 18:16:43 +0000
Date: Mon, 30 Apr 2018 11:16:19 -0700
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2 linux-stable-4.4] ath10k: rebuild crypto header in rx
 data frames
Message-ID: <20180430181619.GA12118@kroah.com>
References: <1525069587-19281-1-git-send-email-srirrama@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1525069587-19281-1-git-send-email-srirrama@codeaurora.org>
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, stable@vger.kernel.org

On Mon, Apr 30, 2018 at 11:56:25AM +0530, Sriram R wrote:
> ath10k has a replay detection issue which was fixed in v4.14 and we would
> like to get this security fix also to linux-stable-4.4.But for that it
> depends on 3 mac80211 patches so the below mac80211 commits needs to be
> picked first in the same order and then apply this patchset.
> 
> f980ebc058c2 : mac80211: allow not sending MIC up from driver for HW crypto
> f631a77ba920 : mac80211: allow same PN for AMSDU sub-frames  
> cef0acd4d7d4 : mac80211: Add RX flag to indicate ICV stripped
> 
> These patches should be applied in that order(commit f980ebc058c2 first)
> and they should apply cleanly with 3-way merge.

Thanks, now queued up.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
