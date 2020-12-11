Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knpXm-0003zi-Bc
 for ath10k@lists.infradead.org; Fri, 11 Dec 2020 21:01:39 +0000
Received: by mail-ot1-x343.google.com with SMTP id b18so9520920ots.0
 for <ath10k@lists.infradead.org>; Fri, 11 Dec 2020 13:01:35 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id c204sm2047971oob.44.2020.12.11.13.01.31
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 13:01:31 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id j20so5022391otq.5
 for <ath10k@lists.infradead.org>; Fri, 11 Dec 2020 13:01:31 -0800 (PST)
MIME-Version: 1.0
References: <1607713210-18320-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1607713210-18320-1-git-send-email-pillair@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 11 Dec 2020 13:00:00 -0800
Message-ID: <CA+ASDXN5UF0KM=xV9e8jTa4XxZ5Tu-yb4yvoaw+56GHx8hf8=A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix error handling in case of CE pipe init failure
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
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Doug Anderson <dianders@chromium.org>

On Fri, Dec 11, 2020 at 11:00 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Currently if the copy engine pipe init fails for snoc based
> chipsets, the rri is not freed.
>
> Fix this error handling for copy engine pipe init
> failure.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Fixes: 4945af5b264f ("ath10k: enable SRRI/DRRI support on ddr for WCN3990")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

Reviewed-by: Brian Norris <briannorris@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
