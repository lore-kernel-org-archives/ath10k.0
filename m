Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1a3G-0005mt-2A
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 18:46:42 +0000
Received: by mail-ej1-x641.google.com with SMTP id bo3so9737548ejb.11
 for <ath10k@lists.infradead.org>; Fri, 31 Jul 2020 11:46:41 -0700 (PDT)
Subject: Re: [PATCH v2 0/3]
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c6c5b3c5-f862-9cee-6863-24f666cc28f5@gmail.com>
Date: Fri, 31 Jul 2020 11:46:31 -0700
MIME-Version: 1.0
In-Reply-To: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
Content-Language: en-US
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
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On 7/31/20 11:27 AM, Rakesh Pillai wrote:
> The history recording will be compiled only if
> ATH10K_DEBUG is enabled, and also enabled via
> the module parameter. Once the history recording
> is enabled via module parameter, it can be enabled
> or disabled runtime via debugfs.

Why not use trace prints and retrieving them via the function tracer?
This seems very ad-hoc.

> 
> ---
> Changes from v1:
> - Add module param and debugfs to enable/disable history recording.
> 
> Rakesh Pillai (3):
>   ath10k: Add history for tracking certain events
>   ath10k: Add module param to enable history
>   ath10k: Add debugfs support to enable event history
> 
>  drivers/net/wireless/ath/ath10k/ce.c      |   1 +
>  drivers/net/wireless/ath/ath10k/core.c    |   3 +
>  drivers/net/wireless/ath/ath10k/core.h    |  82 ++++++++++++
>  drivers/net/wireless/ath/ath10k/debug.c   | 207 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/debug.h   |  75 +++++++++++
>  drivers/net/wireless/ath/ath10k/snoc.c    |  15 ++-
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c |   1 +
>  drivers/net/wireless/ath/ath10k/wmi.c     |  10 ++
>  8 files changed, 393 insertions(+), 1 deletion(-)
> 


-- 
Florian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
