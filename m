Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivZNy-0005ry-0n
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 04:18:59 +0000
Received: by mail-vs1-xe41.google.com with SMTP id t12so3689887vso.13
 for <ath10k@lists.infradead.org>; Sat, 25 Jan 2020 20:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20200123232944.39247-1-swboyd@chromium.org>
In-Reply-To: <20200123232944.39247-1-swboyd@chromium.org>
From: Justin Capella <justincapella@gmail.com>
Date: Sat, 25 Jan 2020 20:18:40 -0800
Message-ID: <CAMrEMU-e55q7uvd220+1kuYJ4Xa-4ckz5CvYezCj2ahn_K8t9w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Use device_get_match_data() to simplify code
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
To: Stephen Boyd <swboyd@chromium.org>
Cc: netdev@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>

Maybe use dev here as well?

>                 dev_err(&pdev->dev, "failed to find matching device tree id\n");

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
