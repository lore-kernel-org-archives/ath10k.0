Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablLU-0007NU-2V
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:44:24 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix sanity check on enabling btcoex via debugfs
Date: Fri, 4 Mar 2016 08:43:59 +0000
Message-ID: <87si06y6nm.fsf@kamboji.qca.qualcomm.com>
References: <1456212516-3989-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1456212516-3989-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Tue, 23 Feb 2016 12:58:36	+0530")
Content-Language: en-US
Content-ID: <571978C7127FA049B44D6221BC635499@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> First check for the device state before enabling / disabling
> btcoex, also return a proper error value. Enabling / disabling
> btcoex ideally does a f/w + ath10k_core_restart so the checks
> that are applicable for 'simulate_fw_crash' shall be applicable
> for this as well
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
