Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFJOk-0002TN-Bt
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 13:40:35 +0000
Received: by mail-lj1-x243.google.com with SMTP id v6-v6so4796635ljc.11
 for <ath10k@lists.infradead.org>; Wed, 24 Oct 2018 06:40:23 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id e24-v6sm427060lfj.30.2018.10.24.06.40.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 06:40:19 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id z21-v6so4824760ljz.0
 for <ath10k@lists.infradead.org>; Wed, 24 Oct 2018 06:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20181023.202921.1185045750138652543.davem@davemloft.net>
 <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
 <CAHk-=wh2H9jE2RXibQgWs3_Q539roj62_gzPXKjnhhKqSFcw2g@mail.gmail.com>
 <87lg6nu6k1.fsf@codeaurora.org> <87h8hbu5uy.fsf@qca.qualcomm.com>
 <CAPBZ5Qen9ak4eFqdHEKNVoGBWUtohu_hwYxZ2cwmyAU=a8Mv9A@mail.gmail.com>
In-Reply-To: <CAPBZ5Qen9ak4eFqdHEKNVoGBWUtohu_hwYxZ2cwmyAU=a8Mv9A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Oct 2018 14:40:03 +0100
Message-ID: <CAHk-=wjjRzVi3qXvKEz7F1kA=YW_Ygp5PA6z6E1Jr-8cy-6J5g@mail.gmail.com>
Subject: Re: [GIT] Networking
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
To: andy.gross@linaro.org
Cc: Govind Singh <govinds@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, david.brown@linaro.org, kvalo@qca.qualcomm.com, jeffrey.t.kirsher@intel.com, niklas.cassel@linaro.org, Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>

On Wed, Oct 24, 2018 at 2:24 PM Andy Gross <andy.gross@linaro.org> wrote:
>
> Yes this will conflict with Niklas's patch which is part of the 4.20
> pull requests. I would prefer that we revert Linus's and take Niklas's
> unless there is a compelling argument to have it fixed before -rc1.

I have no objection to just reverting my patch when I get the real fix.

I just don't want my tree to have warnings that I see, and that may
hide new warnings coming in when I do my next pull request..

               Linus

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
