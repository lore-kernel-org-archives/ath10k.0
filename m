Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifhgI-0002vX-Sf
 for ath10k@lists.infradead.org; Fri, 13 Dec 2019 09:56:20 +0000
Message-ID: <94471b2381bee394f9708eae8ba47129f3facd03.camel@sipsolutions.net>
Subject: Re: [PATCH 2/4] mac80211: fix issue in loop scenario
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Dec 2019 10:56:12 +0100
In-Reply-To: <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082426_564220_0827923D)
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082426_564220_0827923D)
MIME-Version: 1.0
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

On Fri, 2019-12-13 at 15:19 +0800, Yibo Zhao wrote:
> In a loop txqs dequeue scenario, if the first txq in the rbtree gets
> removed from rbtree immediately in the ieee80211_return_txq(), the
> loop will break soon in the ieee80211_next_txq() due to schedule_pos
> not leading to the second txq in the rbtree. Thus update schedule_pos
> to previous node once the node of schedule_pos is either removed from
> rbtree or move to other location in rbtree due to airtime update.

For my understanding - this is a fix to the first patch in the series?

I guess you didn't squash it because that's Toke's patch or something?

I tend to think you still should, and annotate the changes, but I wanted
to understand it first.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
