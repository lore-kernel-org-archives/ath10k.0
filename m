Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TJq-0006tz-Ah
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 08:54:03 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Suppress "Unknown eventid: 36925" warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522049641-19521-1-git-send-email-murugana@codeaurora.org>
References: <1522049641-19521-1-git-send-email-murugana@codeaurora.org>
Message-Id: <20180329085352.0C0D060C55@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 08:53:52 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> FW has Smart Logging feature enabled by default for detecting failures
> and processing FATAL_CONDITION_EVENTID (36925 - 0x903D) back to host.
> 
> Since ath10k doesn't implement the Smart Logging and FATAL CONDITION
> EVENT processing yet, suppressing the unknown event ID warning by moving
> this under ATH10K_DBG_WMI.
> 
> Simulated the same issue by having associated STA powered off when
> ping flood was running from AP backbone. This triggerd STA KICKOUT
> in AP followed by FATAL CONDITION event 36925.
> 
> Issue was reproduced and verified in below DUT
> ------------------------------------------------
> AP mode of OpenWRT QCA9984 running 6.0.8 with FW ver 10.4-3.5.3-00053
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

606204bb863f ath10k: suppress "Unknown eventid: 36925" warnings

-- 
https://patchwork.kernel.org/patch/10307269/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
