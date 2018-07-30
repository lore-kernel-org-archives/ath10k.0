Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCGw-0006Gb-53
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 17:47:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: support for multicast rate control
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1525743291-4306-1-git-send-email-pradeepc@codeaurora.org>
References: <1525743291-4306-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20180730174743.CE6336223E@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 17:47:43 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> Issues a wmi command to firmware when multicast rate change is received with the
> new BSS_CHANGED_MCAST_RATE flag.  Also fixes the incorrect fixed_rate setting
> for CCK rates which got introduced with addition of ath10k_rates_rev2 enum.
> 
> Tested on QCA9984 with firmware ver 10.4-3.6-00104
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cd93b83ad927 ath10k: support for multicast rate control

-- 
https://patchwork.kernel.org/patch/10385043/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
