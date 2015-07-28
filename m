Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK68N-0003SI-2W
 for ath10k@lists.infradead.org; Tue, 28 Jul 2015 14:45:37 +0000
Date: Tue, 28 Jul 2015 10:31:25 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: [PATCH] ath10k: remove NULL ptr deref in variable init of
 ath10k_monitor_vdev_start
Message-ID: <20150728143124.GB17081@tuxdriver.com>
References: <1438024935-3946-1-git-send-email-linville@tuxdriver.com>
 <55B70EEF.9070205@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55B70EEF.9070205@qti.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Jul 28, 2015 at 10:41:11AM +0530, Vasanthakumar Thiagarajan wrote:
> On Tuesday 28 July 2015 12:52 AM, John W. Linville wrote:
> >In ath10k_monitor_vdev_start, chandef is initialized to NULL and then
> >channel is immediately thereafter initialized to chandef->chan (i.e.
> >NULL->chan).  This appears to be some sort of cut-n-paste error, since
> >the same assignment is done later (i.e. after chandef has been properly
> >assigned to a non-NULL value).  So, let's just remove this "brown paper
> >bag" typo/thinko... :-)
> >
> >Coverity CID #1309505
> >
> >Signed-off-by: John W. Linville <linville@tuxdriver.com>
> >---
> >  drivers/net/wireless/ath/ath10k/mac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> >index c9a7d5b5dffc..2823222dea92 100644
> >--- a/drivers/net/wireless/ath/ath10k/mac.c
> >+++ b/drivers/net/wireless/ath/ath10k/mac.c
> >@@ -836,7 +836,7 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
> >  static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
> >  {
> >  	struct cfg80211_chan_def *chandef = NULL;
> >-	struct ieee80211_channel *channel = chandef->chan;
> >+	struct ieee80211_channel *channel;
> >  	struct wmi_vdev_start_request_arg arg = {};
> >  	int ret = 0;
> >
> 
> There is a similar change integrated recently,
> https://github.com/kvalo/ath/commit/19be9e9a7ac7e6050eab426283d2a87593cf6e82

OK.  I don't see much point in the NULL assignment for channel, but the main
point is to avoide the chandef->chan part.

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
