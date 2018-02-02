Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehYmZ-0001IR-UG
 for ath10k@lists.infradead.org; Fri, 02 Feb 2018 10:41:25 +0000
Received: by mail-wm0-x232.google.com with SMTP id t74so11632399wme.3
 for <ath10k@lists.infradead.org>; Fri, 02 Feb 2018 02:41:12 -0800 (PST)
Subject: Re: [PATCH] ath10k: Support mgt frame per-chain rssi
References: <1517533386-30766-1-git-send-email-greearb@candelatech.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5A744045.7020309@broadcom.com>
Date: Fri, 2 Feb 2018 11:41:09 +0100
MIME-Version: 1.0
In-Reply-To: <1517533386-30766-1-git-send-email-greearb@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: greearb@candelatech.com, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

On 2/2/2018 2:03 AM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> This provides per-chain rssh for management frames received

'rssh' should be 'rssi'.

Regards,
Arend

> over wmi.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 21 ++++++++++++++++++++-
>   drivers/net/wireless/ath/ath10k/wmi.h |  1 +
>   2 files changed, 21 insertions(+), 1 deletion(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
