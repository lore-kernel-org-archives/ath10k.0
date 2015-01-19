Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YD8Q8-0005u9-J6
 for ath10k@lists.infradead.org; Mon, 19 Jan 2015 09:14:53 +0000
Received: by mail-wi0-f178.google.com with SMTP id em10so4130811wid.5
 for <ath10k@lists.infradead.org>; Mon, 19 Jan 2015 01:14:30 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC/RFT] ath10k: enable IBSS in multi-vif
Date: Mon, 19 Jan 2015 10:13:53 +0100
Message-Id: <1421658833-13311-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <54B97B96.4040903@darmstadt.freifunk.net>
References: <54B97B96.4040903@darmstadt.freifunk.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: martin@darmstadt.freifunk.net, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The 999.999.0.636 firmware seems to support
concurrent IBSS + AP/STA. At least basic stuff
works so enable it since some people are
interested in this stuff.

If it's broken we can fix, restrict or disable it
later.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
Hi Martin,

Feel free to take this patch and run whatever case
you had in mind. If this proves to work for you
without any major issues (like notorious crashes,
traffic issues and such) I guess we could try
pulling this upstream.

Make sure you use 999.999.0.636 firmware. The 10.x
doesn't support IBSS at all.


 drivers/net/wireless/ath/ath10k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9524bc5..11170ce 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5032,6 +5032,10 @@ static const struct ieee80211_iface_limit ath10k_if_limits[] = {
 	.max	= 7,
 	.types	= BIT(NL80211_IFTYPE_AP)
 	},
+	{
+	.max	= 1,
+	.types	= BIT(NL80211_IFTYPE_ADHOC)
+	},
 };
 
 static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
