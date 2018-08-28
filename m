Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fubgC-0001Hr-Bo
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 10:57:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add waiting htt tx complete before wow enable
References: <1535442443-22152-1-git-send-email-wgong@codeaurora.org>
Date: Tue, 28 Aug 2018 13:56:45 +0300
In-Reply-To: <1535442443-22152-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Tue, 28 Aug 2018 15:47:23 +0800")
Message-ID: <87lg8qg3o2.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> If there have some tx packets pending in firmware, and then system

s/have/are/ but I can fix that.

> enter suspend, firmware will fail for wow enable. This will trigger
> mac80211 to stop ath10k and download firmware again, then it is
> non-wow suspend.
>
> After add the waiting htt tx complete, then firmware will have some
> time window to send or flush the pending tx packets.
>
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
