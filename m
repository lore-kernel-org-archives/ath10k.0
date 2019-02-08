Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs6tY-0007BD-Bi
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 14:12:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Add support to provide higher range mem chunks
 in wmi init command
References: <1544524740-31372-1-git-send-email-svishnoi@codeaurora.org>
Date: Fri, 08 Feb 2019 16:12:40 +0200
In-Reply-To: <1544524740-31372-1-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Tue, 11 Dec 2018 16:09:00 +0530")
Message-ID: <87tvhe74iv.fsf@kamboji.qca.qualcomm.com>
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> writes:

> With the current implementation of wmi init command,
> there is no provision for the host driver to provide mem
> chunks addresses with more than 32-bit, to the firmware.
> WCN3990 is a 35-bit target and can accept mem chunks addresses
> which are above 32-bit.
>
> If firmware supports address range more than 32 bit, it
> advertises the support by setting the WMI_SERVICE_EXTEND_ADDRESS
> service. Based on this service fill the upper bits of paddr while
> providing the mem chunks in the wmi init command.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01552-QCAHLSWMTPL-1
>
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>

Does not apply and I even tried to find a commit from December to make
it work, and as the sha1 is not valid so 3-way merge won't work either.
I strongly recommend to use pristine ath.git master branch (meaning that
there are no other unapplied patches on top) when submitting patches,
otherwise this can happen. Please rebase and resubmit.

Applying: ath10k: Add support to provide higher range mem chunks in wmi init command
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/wmi-tlv.c).
error: could not build fake ancestor
Patch failed at 0001 ath10k: Add support to provide higher range mem chunks in wmi init comman

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
