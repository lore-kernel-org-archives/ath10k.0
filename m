Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihWPy-0005Z6-L7
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 10:19:00 +0000
Message-ID: <c126d2ff0866faf9ac50b12920f0497b03b031f7.camel@sipsolutions.net>
Subject: Re: [PATCH 2/4] mac80211: fix issue in loop scenario
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Dec 2019 11:18:51 +0100
In-Reply-To: <6f092bd44cfc581a219bd0f0506cc636@codeaurora.org>
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082426_564220_0827923D)
 <94471b2381bee394f9708eae8ba47129f3facd03.camel@sipsolutions.net>
 <6f092bd44cfc581a219bd0f0506cc636@codeaurora.org>
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
To: yiboz@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2019-12-18 at 18:12 +0800, yiboz@codeaurora.org wrote:
> 
> Yes, this is a fix to the first patch. Actually, the rest of two patches 
> are also serve the same. So, are you suggesting to merge them to the 
> first patch?

Yes.

> Previouly, I had added Toke's signature in this patch but Toke advised 
> to delete it. I feel a little bit confused about how to handle it. 
> Appreciate any detail guide.

I guess that you have to discuss that with Toke, how he wants to handle
it ... If he gave you a patch with his signed-off-by, then you should
probably keep it? There's also "Co-developed-by" tag to give some sort
of non-author developer credits.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
