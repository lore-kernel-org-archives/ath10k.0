Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyuL-0005QK-H8
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 15:00:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add peer flush in ath10k_flush for STATION
References: <1538989363-12386-1-git-send-email-wgong@codeaurora.org>
Date: Fri, 12 Oct 2018 17:59:03 +0300
In-Reply-To: <1538989363-12386-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Mon, 8 Oct 2018 17:02:43 +0800")
Message-ID: <87zhvj2oug.fsf@kamboji.qca.qualcomm.com>
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

> In the noisy environment, if there are packets in the queue and can't
> send out, the suspend timing will be more than 5 seconds due to the wait,
> flush the queue to optimize the suspend timing, and let the upper layer to
> retry the packets after resume.
>
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>  drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

The patch is slightly corrupted, there should be a "---" line before the
diffstat and that broke my patchwork script. I fixed it now in the
pending branch, but be careful if you manually edit patch files.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
