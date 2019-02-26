Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycJw-0003aL-Cb
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 12:58:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] ath10k: Add support for ack rssi value of
 management tx packets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550055839-24454-2-git-send-email-aambure@codeaurora.org>
References: <1550055839-24454-2-git-send-email-aambure@codeaurora.org>
Message-Id: <20190226125852.130A0611C5@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 12:58:51 +0000 (UTC)
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

4b816f170b1f ath10k: add support for ack rssi value of management tx packets
6ddc3860a566 ath10k: add support for ack rssi value of data tx packets

-- 
https://patchwork.kernel.org/patch/10809625/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
