Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXm5e-0000TI-9G
 for ath10k@lists.infradead.org; Fri, 14 Dec 2018 11:57:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: skip sending quiet mode cmd for WCN3990
References: <1544782666-24837-1-git-send-email-kvalo@codeaurora.org>
Date: Fri, 14 Dec 2018 13:56:54 +0200
In-Reply-To: <1544782666-24837-1-git-send-email-kvalo@codeaurora.org> (Kalle
 Valo's message of "Fri, 14 Dec 2018 12:17:46 +0200")
Message-ID: <87ftv0xqwp.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> writes:

> From: Rakesh Pillai <pillair@codeaurora.org>
>
> HL2.0 firmware does not support setting quiet mode.  If the host driver sends
> the quiet mode setting command to the HL2.0 firmware, it crashes with the below
> signature.
>
> fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
>
> The quiet mode command support is exposed by the firmware via thermal throttle
> wmi service. Enable ath10k thermal support if thermal throttle wmi service bit
> is set.  10.x firmware versions support this feature by default, but
> unfortunately do not advertise the support via service flags, hence have to
> manually set the service flag in ath10k_core_compat_services().
>
> Compile tested only.

I'm planning to queue this for 4.20 as wcn3990 support won't work
otherwise. But I wasn't able to test this so can someone help, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
