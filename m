Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWra-0006PX-JZ
 for ath10k@lists.infradead.org; Wed, 02 Dec 2020 18:28:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: Fix the parsing error in service available
 event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
References: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20201202182822.877F2C433ED@smtp.codeaurora.org>
Date: Wed,  2 Dec 2020 18:28:22 +0000 (UTC)
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
Cc: kuabhs@chromium.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The wmi service available event has been
> extended to contain extra 128 bit for new services
> to be indicated by firmware.
> 
> Currently the presence of any optional TLVs in
> the wmi service available event leads to a parsing
> error with the below error message:
> ath10k_snoc 18800000.wifi: failed to parse svc_avail tlv: -71
> 
> The wmi service available event parsing should
> not return error for the newly added optional TLV.
> Fix this parsing for service available event message.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00720-QCAHLSWMTPL-1
> 
> Fixes: cea19a6ce8bf ("ath10k: add WMI_SERVICE_AVAILABLE_EVENT support")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c7cee9c0f499 ath10k: Fix the parsing error in service available event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1605501291-23040-1-git-send-email-pillair@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
