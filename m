Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb6qm-0006vB-QU
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 11:53:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/4] ath10k: Add support to configure pktlog filter
References: <1412269778-1045-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1412269778-1045-2-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 6 Oct 2014 14:52:45 +0300
In-Reply-To: <1412269778-1045-2-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 2 Oct 2014 22:39:35 +0530")
Message-ID: <877g0dl8j6.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Add support to configure packet log filters (tx, rx, rate control)
> via debugfs. To disable htt pktlog events set the filters to 0.
>
> ex:
>
> To enable pktlog for all filters
>
>    echo 0x1f > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
>
> To disable pktlog
>
>    echo 0 > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

I did minor changes to the error handling in
ath10k_write_pktlog_filter() and in ath10k_debug_start(). Diff below and
full commit here:

https://github.com/kvalo/ath/commit/470c43d83b7ee4147dea38a4f7b986070555a032

Please review my changes.

Kalle

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index a5700a2aff8c..fe71494cefa9 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1396,15 +1396,20 @@ int ath10k_debug_start(struct ath10k *ar)
 				    ret);
 	}
 
-	if (ar->debug.pktlog_filter)
+	if (ar->debug.pktlog_filter) {
 		ret = ath10k_wmi_pdev_pktlog_enable(ar,
 						    ar->debug.pktlog_filter);
-	else
+		if (ret)
+			/* not serious */
+			ath10k_warn(ar,
+				    "failed to enable pktlog filter %x: %d",
+				    ar->debug.pktlog_filter, ret);
+	} else {
 		ret = ath10k_wmi_pdev_pktlog_disable(ar);
-
-	if (ret)
-		ath10k_warn(ar, "failed to send pktlog command: %d filter %x",
-			    ret, ar->debug.pktlog_filter);
+		if (ret)
+			/* not serious */
+			ath10k_warn(ar, "failed to disable pktlog: %d", ret);
+	}
 
 	return ret;
 }
@@ -1520,23 +1525,31 @@ static ssize_t ath10k_write_pktlog_filter(struct file *file,
 
 	if (ar->state != ATH10K_STATE_ON) {
 		ar->debug.pktlog_filter = filter;
-		mutex_unlock(&ar->conf_mutex);
-		return count;
+		ret = count;
+		goto out;
 	}
 
-	if (filter && (filter != ar->debug.pktlog_filter))
+	if (filter && (filter != ar->debug.pktlog_filter)) {
 		ret = ath10k_wmi_pdev_pktlog_enable(ar, filter);
-	else
+		if (ret) {
+			ath10k_warn(ar, "failed to enable pktlog filter %x: %d",
+				    ar->debug.pktlog_filter, ret);
+			goto out;
+		}
+	} else {
 		ret = ath10k_wmi_pdev_pktlog_disable(ar);
+		if (ret) {
+			ath10k_warn(ar, "failed to disable pktlog: %d", ret);
+			goto out;
+		}
+	}
 
 	ar->debug.pktlog_filter = filter;
-	mutex_unlock(&ar->conf_mutex);
-
-	if (ret)
-		ath10k_warn(ar, "failed to send pktlog command: %d filter %x",
-			    ret, ar->debug.pktlog_filter);
+	ret = count;
 
-	return count;
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
 }
 
 static ssize_t ath10k_read_pktlog_filter(struct file *file, char __user *ubuf,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
