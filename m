Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIqN1-0007WF-86
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:33:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: check data ack rssi enabled/disabled in htt rx
 event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561707084-10021-1-git-send-email-bpothuno@codeaurora.org>
References: <1561707084-10021-1-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20191011083354.B000460D35@smtp.codeaurora.org>
Date: Fri, 11 Oct 2019 08:33:54 +0000 (UTC)
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> For all data packets transmitted, host gets htt tx completion event. Some QCA9984
> firmware releases support WMI_SERVICE_TX_DATA_ACK_RSSI, which gives data
> ack rssi values to host through htt event of data tx completion. Data ack rssi
> values are valid if A0 bit is set in HTT rx message. So enable the feature also
> for QCA9884.
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.9.0.2-00044
> 
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> [kvalo@codeaurora.org: improve commit log]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cc78dc3b7906 ath10k: enable transmit data ack RSSI for QCA9884

-- 
https://patchwork.kernel.org/patch/11021495/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
