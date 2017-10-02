Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyvHw-0006iO-UZ
 for ath10k@lists.infradead.org; Mon, 02 Oct 2017 07:37:18 +0000
Received: by mail-qk0-x233.google.com with SMTP id w134so4392400qkb.0
 for <ath10k@lists.infradead.org>; Mon, 02 Oct 2017 00:36:54 -0700 (PDT)
Subject: Re: [PATCH 01/11] ath10k_sdio: sdio htt data transfer fixes
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-2-git-send-email-alagusankar@silex-india.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <59D1EC94.2020307@broadcom.com>
Date: Mon, 2 Oct 2017 09:36:52 +0200
MIME-Version: 1.0
In-Reply-To: <1506793068-27445-2-git-send-email-alagusankar@silex-india.com>
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
To: silexcommon@gmail.com, ath10k@lists.infradead.org
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org

On 9/30/2017 7:37 PM, silexcommon@gmail.com wrote:
> From: Alagu Sankar <alagusankar@silex-india.com>
>

[...]

>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>

Not really have a specific remark for this patch, but for the entire 
series. These patches are sent using an anonymous email address, apart 
from 'silex' being in there, which does not show up in the certificate 
of origin. Just wondering if this is acceptable?

Regards,
Arend

> ---
>   drivers/net/wireless/ath/ath10k/core.c   | 20 +++++++++++++++++---
>   drivers/net/wireless/ath/ath10k/htt_rx.c |  6 ++++--
>   drivers/net/wireless/ath/ath10k/htt_tx.c | 24 +++++++++++++++++++-----
>   3 files changed, 40 insertions(+), 10 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
