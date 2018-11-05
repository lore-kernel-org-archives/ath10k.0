Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJmFU-0004XD-6s
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 21:17:29 +0000
Received: by mail-ed1-x544.google.com with SMTP id a14-v6so4564092edr.7
 for <ath10k@lists.infradead.org>; Mon, 05 Nov 2018 13:17:17 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51])
 by smtp.gmail.com with ESMTPSA id n34-v6sm8069774edc.34.2018.11.05.13.17.13
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 13:17:13 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id w19-v6so8770691eds.1
 for <ath10k@lists.infradead.org>; Mon, 05 Nov 2018 13:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181105130403.93B6560600@smtp.codeaurora.org>
In-Reply-To: <20181105130403.93B6560600@smtp.codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 5 Nov 2018 13:17:00 -0800
Message-ID: <CA+ASDXMz37pOFjeETM_xUQSBuLvki6G==v=RUO1T5G1t6Yv+dg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: govinds@codeaurora.org, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>

On Mon, Nov 5, 2018 at 5:04 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> This patchset (I think it was with the first patch, but not sure) had some
> conflicts but 3-way merge was able to automatically solve them. Please check
> the end result anyway:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=77adda81e264e0c93af9570ac4ada82a5d0f5d99

I see the same. There were some unrelated changes to this file that
you merged to your pending tree in the meantime. The end result looks
fine to me. Thanks for the heads up.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
