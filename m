Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgGjP-0001xV-R2
 for ath10k@lists.infradead.org; Sat, 21 Nov 2020 00:26:24 +0000
Received: by mail-vk1-xa42.google.com with SMTP id w67so2631185vke.10
 for <ath10k@lists.infradead.org>; Fri, 20 Nov 2020 16:26:21 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id f201sm565815vka.44.2020.11.20.16.26.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 16:26:19 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id u16so2651183vkb.1
 for <ath10k@lists.infradead.org>; Fri, 20 Nov 2020 16:26:19 -0800 (PST)
MIME-Version: 1.0
References: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2020 16:26:07 -0800
Message-ID: <CAD=FV=Xnk-VeZKy3vzr4VZNW+OogfwEAjU-QVHQRYD-yix8LPQ@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: Fix the parsing error in service available
 event
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
Cc: Abhishek Kumar <kuabhs@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

On Sun, Nov 15, 2020 at 8:35 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
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
> ---
> Changes from v2:
> - Add code documentation explaining the necessity of variable
>   initialization for the logic to work.
> ---
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 +++-
>  drivers/net/wireless/ath/ath10k/wmi.c     | 9 +++++++--
>  drivers/net/wireless/ath/ath10k/wmi.h     | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)

This looks nice to me now.  I will let Kalle decide what to do about
the checkpatch issue that Abhishek found (ignore, fix himself, or
request another spin).

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
