Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B77C433EF
	for <ath10k@archiver.kernel.org>; Tue,  8 Mar 2022 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhEIXkMlXzdo+q/ZC+pERpr1rO5+LQKwmnZ0Tt6rZZU=; b=PfrG9gxW033IFg
	h3KxkRkPKhSu7Yv8NF2yxwq69/zox2OOh3SjsU/4rT8X8JbSzn+5oych4C/qM7wVq885AdAZCtipC
	Ou9OQuKxTDIhqldG8yGfpH6n8/hktMnRoepuZqIT77XA9VanWLWqtGFInKiF9EjUiQTXzHGad+ocd
	4kjEgelAvgtq3r2wOT59Dp8E5aC/irGO+gsVbnKyEOWE45Fw9PIymV4eQ5/zDAZyYRTqNReIOM/Lx
	XBRLuxP84Qt0NLqkpRScrP9LMV+zASlreOeQRMLvD2Ik6SFGTvZ3vSDcGr6btSRJF09m6af2GAibP
	t4X+0Z+UHT5ShMyGM+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRYPy-004EV2-1b; Tue, 08 Mar 2022 11:54:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRYPt-004ETd-MY
 for ath10k@lists.infradead.org; Tue, 08 Mar 2022 11:54:15 +0000
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 03:54:11 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 08 Mar 2022 03:53:41 -0800
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg02-blr.qualcomm.com with ESMTP; 08 Mar 2022 17:23:30 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id A16E322681; Tue,  8 Mar 2022 17:23:29 +0530 (IST)
From: Youghandhar Chintala <youghand@codeaurora.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 pillair@codeaurora.org, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, mpubbise@codeaurora.org,
 Youghandhar Chintala <youghand@codeaurora.org>
Subject: [PATCH v5 1/2] mac80211: Add support to trigger sta disconnect on
 hardware restart
Date: Tue,  8 Mar 2022 17:23:24 +0530
Message-Id: <20220308115325.5246-2-youghand@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220308115325.5246-1-youghand@codeaurora.org>
References: <20220308115325.5246-1-youghand@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_035413_783201_BECBA8DE 
X-CRM114-Status: GOOD (  17.20  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Currently in case of target hardware restart, we just reconfig and
re-enable the security keys and enable the network queues to start
data traffic back from where it was interrupted.

Many ath10k wifi chipsets have sequence numbers for the data
packets assigned by firmware and the mac sequence number will
restart from zero after target hardware restart leading to mismatch
in the sequence number expected by the remote peer vs the sequence
number of the frame sent by the target firmware.

This mismatch in sequence number will cause out-of-order packets
on the remote peer and all the frames sent by the device are dropped
until we reach the sequence number which was sent before we restarted
the target hardware

In order to fix this, we trigger a sta disconnect, in case of target
hw restart. After this there will be a fresh connection and thereby
avoiding the dropping of frames by remote peer.

The right fix would be to pull the entire data path into the host
which is not feasible or would need lots of complex changes and
will still be inefficient.

Tested on ath10k using WCN3990, QCA6174

Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
---
 include/net/mac80211.h     | 10 ++++++++++
 net/mac80211/ieee80211_i.h |  3 +++
 net/mac80211/mlme.c        | 12 ++++++++++++
 net/mac80211/util.c        | 33 ++++++++++++++++++++++++++++++---
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index bd6912d0292b..2f9236e8e33d 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -6064,6 +6064,16 @@ void ieee80211_disconnect(struct ieee80211_vif *vif, bool reconnect);
  */
 void ieee80211_resume_disconnect(struct ieee80211_vif *vif);
 
+/**
+ * ieee80211_hw_restart_disconnect - disconnect from AP after
+ * hardware restart
+ * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ *
+ * Instructs mac80211 to disconnect from the AP after
+ * hardware restart.
+ */
+void ieee80211_hw_restart_disconnect(struct ieee80211_vif *vif);
+
 /**
  * ieee80211_cqm_rssi_notify - inform a configured connection quality monitoring
  *	rssi threshold triggered
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index da35791b8378..7819cdf7ddfa 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -765,6 +765,8 @@ struct ieee80211_if_mesh {
  *	back to wireless media and to the local net stack.
  * @IEEE80211_SDATA_DISCONNECT_RESUME: Disconnect after resume.
  * @IEEE80211_SDATA_IN_DRIVER: indicates interface was added to driver
+ * @IEEE80211_SDATA_DISCONNECT_HW_RESTART: Disconnect after hardware restart
+ *  recovery
  */
 enum ieee80211_sub_if_data_flags {
 	IEEE80211_SDATA_ALLMULTI		= BIT(0),
@@ -772,6 +774,7 @@ enum ieee80211_sub_if_data_flags {
 	IEEE80211_SDATA_DONT_BRIDGE_PACKETS	= BIT(3),
 	IEEE80211_SDATA_DISCONNECT_RESUME	= BIT(4),
 	IEEE80211_SDATA_IN_DRIVER		= BIT(5),
+	IEEE80211_SDATA_DISCONNECT_HW_RESTART	= BIT(6),
 };
 
 /**
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 20b57ddf149c..7e5be39dc6cc 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4863,6 +4863,18 @@ void ieee80211_sta_restart(struct ieee80211_sub_if_data *sdata)
 		sdata_unlock(sdata);
 		return;
 	}
+
+	if (sdata->flags & IEEE80211_SDATA_DISCONNECT_HW_RESTART) {
+		sdata->flags &= ~IEEE80211_SDATA_DISCONNECT_HW_RESTART;
+		mlme_dbg(sdata, "driver requested disconnect after hardware restart\n");
+		ieee80211_sta_connection_lost(sdata,
+					      ifmgd->associated->bssid,
+					      WLAN_REASON_UNSPECIFIED,
+					      true);
+		sdata_unlock(sdata);
+		return;
+	}
+
 	sdata_unlock(sdata);
 }
 #endif
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index abc29df6834c..4b791f94751f 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -2321,6 +2321,7 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 	struct cfg80211_sched_scan_request *sched_scan_req;
 	bool sched_scan_stopped = false;
 	bool suspended = local->suspended;
+	bool in_reconfig = false;
 
 	/* nothing to do if HW shouldn't run */
 	if (!local->open_count)
@@ -2672,6 +2673,7 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 		drv_reconfig_complete(local, IEEE80211_RECONFIG_TYPE_RESTART);
 
 	if (local->in_reconfig) {
+		in_reconfig = local->in_reconfig;
 		local->in_reconfig = false;
 		barrier();
 
@@ -2689,6 +2691,15 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 					IEEE80211_QUEUE_STOP_REASON_SUSPEND,
 					false);
 
+	if (in_reconfig) {
+		list_for_each_entry(sdata, &local->interfaces, list) {
+			if (!ieee80211_sdata_running(sdata))
+				continue;
+			if (sdata->vif.type == NL80211_IFTYPE_STATION)
+				ieee80211_sta_restart(sdata);
+		}
+	}
+
 	if (!suspended)
 		return 0;
 
@@ -2718,7 +2729,7 @@ int ieee80211_reconfig(struct ieee80211_local *local)
 	return 0;
 }
 
-void ieee80211_resume_disconnect(struct ieee80211_vif *vif)
+static void ieee80211_reconfig_disconnect(struct ieee80211_vif *vif, u8 flag)
 {
 	struct ieee80211_sub_if_data *sdata;
 	struct ieee80211_local *local;
@@ -2730,19 +2741,35 @@ void ieee80211_resume_disconnect(struct ieee80211_vif *vif)
 	sdata = vif_to_sdata(vif);
 	local = sdata->local;
 
-	if (WARN_ON(!local->resuming))
+	if (WARN_ON(flag & IEEE80211_SDATA_DISCONNECT_RESUME &&
+		    !local->resuming))
+		return;
+
+	if (WARN_ON(flag & IEEE80211_SDATA_DISCONNECT_HW_RESTART &&
+		    !local->in_reconfig))
 		return;
 
 	if (WARN_ON(vif->type != NL80211_IFTYPE_STATION))
 		return;
 
-	sdata->flags |= IEEE80211_SDATA_DISCONNECT_RESUME;
+	sdata->flags |= flag;
 
 	mutex_lock(&local->key_mtx);
 	list_for_each_entry(key, &sdata->key_list, list)
 		key->flags |= KEY_FLAG_TAINTED;
 	mutex_unlock(&local->key_mtx);
 }
+
+void ieee80211_hw_restart_disconnect(struct ieee80211_vif *vif)
+{
+	ieee80211_reconfig_disconnect(vif, IEEE80211_SDATA_DISCONNECT_HW_RESTART);
+}
+EXPORT_SYMBOL_GPL(ieee80211_hw_restart_disconnect);
+
+void ieee80211_resume_disconnect(struct ieee80211_vif *vif)
+{
+	ieee80211_reconfig_disconnect(vif, IEEE80211_SDATA_DISCONNECT_RESUME);
+}
 EXPORT_SYMBOL_GPL(ieee80211_resume_disconnect);
 
 void ieee80211_recalc_smps(struct ieee80211_sub_if_data *sdata)
-- 
2.29.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
