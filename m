Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eWQkL-000116-70
 for ath10k@lists.infradead.org; Tue, 02 Jan 2018 17:53:06 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id BE86940C2BA
 for <ath10k@lists.infradead.org>; Tue,  2 Jan 2018 09:52:49 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: 10.4 firmware stats struct issue
Message-ID: <def3524e-1265-27c7-8d71-d4c99c638a9c@candelatech.com>
Date: Tue, 2 Jan 2018 09:52:49 -0800
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

I notice that the 10.4 stats struct appears to be missing a field.  It appears
it should be like this instead?

[greearb@ben-dt3 ath10k]$ git diff
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 66b446d..93ca8e8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4434,6 +4434,7 @@ struct wmi_10_4_pdev_stats {
         struct wmi_pdev_stats_base base;
         struct wmi_10_4_pdev_stats_tx tx;
         struct wmi_pdev_stats_rx rx;
+       __le32 pdev_rx_timeout;
         __le32 rx_ovfl_errs;
         struct wmi_pdev_stats_mem mem;
         __le32 sram_free_size;


Could someone with FW src double-check this?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
