Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agHKW-00025a-6X
 for ath10k@lists.infradead.org; Wed, 16 Mar 2016 19:42:05 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Introduce Extended Resource Config support
 for 10.4
Date: Wed, 16 Mar 2016 10:21:10 +0000
Message-ID: <87h9g6lo4y.fsf@kamboji.qca.qualcomm.com>
References: <1458052250-2529-1-git-send-email-mohammed@qca.qualcomm.com>
 <1458052250-2529-2-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1458052250-2529-2-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Tue, 15 Mar 2016 20:00:49	+0530")
Content-Language: en-US
Content-ID: <89837830998D744E960317EC35775B38@qualcomm.com>
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
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Raja Mani <rmani@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Raja Mani <rmani@qti.qualcomm.com>
>
> Add API support for Extended Resource Configuration for 10.4. This
> is useful to enable new features like Peer Stats, LTEU etc if the
> firmware advertises support for the service. This is also done to
> provide backward compatibility with older firmware. Also for clarity
> send default host platform type as 'WMI_HOST_PLATFORM_HIGH_PERF',
> though this should not make any difference in functionality
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

[...]

> @@ -2665,7 +2666,32 @@ struct wmi_resource_config_10_4 {
>  	 * 0  - This is not qwrap
>  	 */
>  	__le32 qwrap_config;
> -} __packed;
> +} __packed

This doesn't compile:

In file included from drivers/net/wireless/ath/ath10k/core.h:32:0,
                 from drivers/net/wireless/ath/ath10k/htt.c:22:
drivers/net/wireless/ath/ath10k/wmi.h:2680:1: error: expected ';',
                 identifier or '(' before 'enum'
make[1]: *** [drivers/net/wireless/ath/ath10k/htt.o] Error 1
In file included from drivers/net/wireless/ath/ath10k/core.h:32:0,
                 from drivers/net/wireless/ath/ath10k/debug.c:25:
drivers/net/wireless/ath/ath10k/wmi.h:2680:1: error: expected ';',
                 identifier or '(' before 'enum'

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
