Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7bF-0007Rm-6W
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:32:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Skip handling del_server during driver exit
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588663061-12138-1-git-send-email-pillair@codeaurora.org>
References: <1588663061-12138-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20200511123159.C3936C58A02@smtp.codeaurora.org>
Date: Mon, 11 May 2020 12:31:59 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The qmi infrastructure sends the client a del_server
> event when the client releases its qmi handle. This
> is not the msg indicating the actual qmi server exiting.
> In such cases the del_server msg should not be processed,
> since the wifi firmware does not reset its qmi state.
> 
> Hence skip the processing of del_server event when the
> driver is unloading.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7c6d67b136ce ath10k: Skip handling del_server during driver exit

-- 
https://patchwork.kernel.org/patch/11528317/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
