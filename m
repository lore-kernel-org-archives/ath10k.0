Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycRu-0008Pl-Qq
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 13:07:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: update the max num of peers supported for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550570468-25869-1-git-send-email-aambure@codeaurora.org>
References: <1550570468-25869-1-git-send-email-aambure@codeaurora.org>
Message-Id: <20190226130706.2E9386110F@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 13:07:06 +0000 (UTC)
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

> WCN3990 firmware versions WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1 & onwards
> supports maximum 33 peers including self peer. To support maximum peers,
> send updated peer param to firmware during initialization.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

15493239eacf ath10k: update the max num of peers supported for WCN3990

-- 
https://patchwork.kernel.org/patch/10819597/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
