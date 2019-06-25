Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl06-0006Zz-PD
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:56:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: enabling tx stats support over pktlog
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557759187-23910-1-git-send-email-bpothuno@codeaurora.org>
References: <1557759187-23910-1-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20190625125642.14A2860867@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:56:41 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> For QCA988X target, pktlog gives details of the tx bitrate
> which is used in the driver for station info.
> 
> Enabling pktlog by default will cause more interrupts
> in target to host CE pipe, which can impact more CPU usage
> for targets ex:WCN3990 and also not required for all other
> platforms (eg: WCN3990), for getting tx bitrate.
> 
> Enable pktlog only for QCA988X based on hardware params.
> 
> Tested HW : WCN3990
> Tested FW : WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: e8123bb74c4e ("ath10k: add per peer tx stats support for 10.2.4")
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4fa42adebe5b ath10k: enabling tx stats support over pktlog

-- 
https://patchwork.kernel.org/patch/10941167/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
