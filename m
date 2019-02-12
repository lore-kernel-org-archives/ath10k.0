Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gteG5-0005ss-30
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 20:02:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath10k: Add support for ack rssi value of
 management tx packets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549975191-20912-2-git-send-email-aambure@codeaurora.org>
References: <1549975191-20912-2-git-send-email-aambure@codeaurora.org>
Message-Id: <20190212200220.4AA1E60A7E@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 20:02:14 +0000 (UTC)
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
To: Abhishek Ambure <aambure@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Abhishek Ambure <aambure@codeaurora.org> wrote:

> In WCN3990, WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI service Indicates that
> the firmware has the capability to send the RSSI value of the ACK for all
> data and management packets transmitted.
> 
> If WMI_RSRC_CFG_FLAG_TX_ACK_RSSI is set in host capability then firmware
> sends RSSI value in "management" tx completion event. Host extracts ack
> rssi values of management packets from their tx completion event.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> V2: Tested HW & Tested FW added

Does not apply. Also the sha1 information was incorrect so 3-way merge
didn't work. Did you use ath.git master branch as the baseline for these
patches?

error: patch failed: drivers/net/wireless/ath/ath10k/wmi-tlv.c:1619
error: drivers/net/wireless/ath/ath10k/wmi-tlv.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath10k/wmi-tlv.h:1578
error: drivers/net/wireless/ath/ath10k/wmi-tlv.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath10k/wmi.c:2369
error: drivers/net/wireless/ath/ath10k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

10807833 [v2,1/2] ath10k: Add support for ack rssi value of management tx packets
10807837 [v2,2/2] ath10k: Add support for ack rssi value of data tx packets

-- 
https://patchwork.kernel.org/patch/10807833/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
