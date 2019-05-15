Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQk2K-0007IN-91
 for ath10k@lists.infradead.org; Wed, 15 May 2019 02:52:57 +0000
Received: by mail-qt1-x841.google.com with SMTP id d13so1619866qth.5
 for <ath10k@lists.infradead.org>; Tue, 14 May 2019 19:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <1556524457-17469-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1556524457-17469-1-git-send-email-wgong@codeaurora.org>
From: Claire Chang <tientzu@google.com>
Date: Wed, 15 May 2019 10:52:41 +0800
Message-ID: <CALiNf29_GwSEUJ_vdp+_1DeDyFZj0uuUY9kYh94w4P_eeDT=8g@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add support for simulate crash on SDIO chip
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
To: Wen Gong <wgong@codeaurora.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Tested-by: Claire Chang <tientzu@chromium.org>

If this patch adds support for detecting the real firmware assert,
maybe the title should be "add support for _crash recovery_ on SDIO
chip"

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
