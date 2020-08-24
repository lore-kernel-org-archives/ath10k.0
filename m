Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAMEl-0007mc-Cl
 for ath10k@lists.infradead.org; Mon, 24 Aug 2020 23:50:52 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b16so5062290vsl.6
 for <ath10k@lists.infradead.org>; Mon, 24 Aug 2020 16:50:48 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id c193sm1635565vke.11.2020.08.24.16.50.45
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 16:50:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id r7so5412681vsq.5
 for <ath10k@lists.infradead.org>; Mon, 24 Aug 2020 16:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Aug 2020 16:50:33 -0700
Message-ID: <CAD=FV=WTnULQs5skJiXfp+srsx5e8DeqW3uu2SEDVGoEmP2O1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] ath10k: Add chain-1 voltage regulator voting
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
To: Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add the support to vote for the chain-1
> voltage regulator for WCN3990. This is
> added as an optional property.
>
> Rakesh Pillai (2):
>   dt: bindings: Add new regulator as optional property for WCN3990
>   ath10k: Add support for chain1 regulator supply voting
>
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
>  drivers/net/wireless/ath/ath10k/snoc.c                         | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)

This series is marked as "Awaiting Upstream" in patchwork.  I don't
see anything blocking it landing now.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
