Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8Cxd-0004ab-WF
 for ath10k@lists.infradead.org; Mon, 05 Jan 2015 19:05:06 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 24E0440DD4B
 for <ath10k@lists.infradead.org>; Mon,  5 Jan 2015 11:04:43 -0800 (PST)
Message-ID: <54AAE04A.4060000@candelatech.com>
Date: Mon, 05 Jan 2015 11:04:42 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Clean up scan when start fails?
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
To: ath10k <ath10k@lists.infradead.org>

Should we have something like this to clean up the scan
state machine when firmware fails to start the scan?

[greearb@ben-dt2 linux-3.19.dev.y]$ git diff
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6e4ece0..9020204 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1057,6 +1057,7 @@ static int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb)
                break;
        case WMI_SCAN_EVENT_START_FAILED:
                ath10k_warn(ar, "received scan start failure event\n");
+               ath10k_wmi_event_scan_completed(ar);
                break;
        case WMI_SCAN_EVENT_DEQUEUED:
        case WMI_SCAN_EVENT_PREEMPTED:
[greearb@ben-dt2 linux-3.19.dev.y]$


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
