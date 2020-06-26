Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowH7-0006hq-86
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 21:52:46 +0000
Received: by mail-qk1-x743.google.com with SMTP id z63so10168775qkb.8
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:52:44 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49])
 by smtp.gmail.com with ESMTPSA id t138sm4360681qka.15.2020.06.26.14.52.42
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 14:52:42 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id m9so5179957qvx.5
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
 <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
In-Reply-To: <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 26 Jun 2020 14:52:30 -0700
Message-ID: <CA+ASDXNOCFZhdNMDk9XTuC2H+owQ0+wHipDbkJAGnU9q7BXz_w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
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
To: Doug Anderson <dianders@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 26, 2020 at 2:49 PM Doug Anderson <dianders@chromium.org> wrote:
> I should also note that, while I'm not terribly familiar with Kalle's
> workflow, I would have expected to see him in the "To:" list.  I've
> added him, but it's possible he'll need you to repost the patch with
> him in the "To:" list.

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#who_to_address
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

Patchwork is his patch queue, so I don't think you need to address him directly.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
