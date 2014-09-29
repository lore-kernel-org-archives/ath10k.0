Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0178.hostedemail.com ([216.40.44.178]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYfI5-0004Oi-If
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 18:03:18 +0000
Message-ID: <1412013755.4302.45.camel@joe-AO725>
Subject: Re: checkpatch: CHECK: No space is necessary after a cast
From: Joe Perches <joe@perches.com>
Date: Mon, 29 Sep 2014 11:02:35 -0700
In-Reply-To: <874mvq1w9v.fsf@kamboji.qca.qualcomm.com>
References: <874mvq1w9v.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Dan Carpenter <error27@gmail.com>

On Mon, 2014-09-29 at 14:49 +0300, Kalle Valo wrote:
> Hi Joe,
> 
> I have a problem with checkpatch. On ath10k we have this function:
> 
> static inline struct ath10k_skb_cb *ATH10K_SKB_CB(struct sk_buff *skb)
> {
> 	BUILD_BUG_ON(sizeof(struct ath10k_skb_cb) >
> 		     IEEE80211_TX_INFO_DRIVER_DATA_SIZE);
> 	return (struct ath10k_skb_cb *)&IEEE80211_SKB_CB(skb)->driver_data;
> }
> 
> And the BUILD_BUG_ON triggers this warning:
> 
> drivers/net/wireless/ath/ath10k/core.h:85: CHECK: No space is necessary after a cast
> 
> Any advice how to handle that?

It's a checkpatch false positive that could be fixed.

It needs something like another test to look for
sizeof(type) as not a cast and more arithmetic/comparison
uses.

Maybe you can test this?
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 52a223e..6132329 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2515,7 +2515,8 @@ sub process {
 			}
 		}
 
-		if ($line =~ /^\+.*\(\s*$Type\s*\)[ \t]+(?!$Assignment|$Arithmetic|{)/) {
+		if ($line =~ /^\+.*(\w+\s*)?\(\s*$Type\s*\)[ \t]+(?!$Assignment|$Arithmetic|[,;\({\[\<\>])/ &&
+		    (!defined($1) || $1 !~ /sizeof\s*/)) {
 			if (CHK("SPACING",
 				"No space is necessary after a cast\n" . $herecurr) &&
 			    $fix) {



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
