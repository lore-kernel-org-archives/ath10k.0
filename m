Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr50040.outbound.protection.outlook.com ([40.107.5.40]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqOHc-0005qW-Ag
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 19:17:58 +0000
Subject: Re: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS
 changed"
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <80c73674-7508-9804-fa5b-12afcc296353@bowerswilkins.com>
Date: Mon, 26 Feb 2018 11:17:31 -0800
MIME-Version: 1.0
In-Reply-To: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



> This reverts commit 55884c045d31a29cf69db8332d1064a1b61dd159.
>
> When Ath10k is in AP mode and an unassociated STA sends a VHT action frame
> (Operating Mode Notification for the NSS change) periodically to AP this causes
> ath10k to call ath10k_station_assoc() which sends WMI_PEER_ASSOC_CMDID during
> NSS update. Over the time (with a certain client it can happen within 15 mins
> when there are over 500 of these VHT action frames) continuous calls of
> WMI_PEER_ASSOC_CMDID cause firmware to assert due to resource exhaust.
Can you include the FW assert message in this commit?

Thanks,
Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
