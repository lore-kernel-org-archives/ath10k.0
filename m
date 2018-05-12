Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHRHi-0000YN-2X
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:57:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
Date: Sat, 12 May 2018 12:57:35 +0300
In-Reply-To: <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
 (Sriram R.'s message of "Mon, 30 Apr 2018 23:15:39 +0530")
Message-ID: <87a7t5urg0.fsf@kamboji.qca.qualcomm.com>
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> writes:

> In the 10.4-3.6 firmware branch there's a new DFS Host confirmation
> feature which is advertised using WMI_SERVICE_HOST_DFS_CHECK_SUPPORT flag.
>
> This new features enables the ath10k host to send information to the
> firmware on the specifications of detected radar type. This allows the
> firmware to validate if the host's radar pattern detector unit is
> operational and check if the radar information shared by host matches
> the radar pulses sent as phy error events from firmware. If the check
> fails the firmware won't allow use of DFS channels on AP mode when using
> FCC regulatory region.
>
> Supported Chipsets : QCA9984/QCA9888/QCA4019
> Firmware Version : 10.4-3.6-00104
>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

This introduces a new checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi.c:3753: Please use a blank line after function/struct/union/enum declarations

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
