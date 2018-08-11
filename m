Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foYbp-0005vz-BA
 for ath10k@lists.infradead.org; Sat, 11 Aug 2018 18:27:30 +0000
Received: by mail-wm0-f68.google.com with SMTP id r24-v6so4097729wmh.0
 for <ath10k@lists.infradead.org>; Sat, 11 Aug 2018 11:27:19 -0700 (PDT)
Subject: Re: [PATCH] ath10k: retrieve MAC address from firmware if provided
References: <20180810233948.144792-1-briannorris@chromium.org>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5B6F2A47.7070502@broadcom.com>
Date: Sat, 11 Aug 2018 20:26:15 +0200
MIME-Version: 1.0
In-Reply-To: <20180810233948.144792-1-briannorris@chromium.org>
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
To: Brian Norris <briannorris@chromium.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On 8/11/2018 1:39 AM, Brian Norris wrote:
> Devices may provide their own MAC address via system firmware (e.g.,

You got me confused by using just "firmware" in the subject.

> device tree), especially in the case where the device doesn't have a
> useful EEPROM on which to store its MAC address (e.g., for integrated
> Wifi).
>
> Use the generic device helper to retrieve the MAC address, and (if
> present) honor it above the MAC address advertised by the card.

But this put me back on track ;-)

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>   drivers/net/wireless/ath/ath10k/core.c | 3 +++
>   drivers/net/wireless/ath/ath10k/wmi.c  | 3 ++-
>   2 files changed, 5 insertions(+), 1 deletion(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
