Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTwyh-00018n-70
 for ath10k@lists.infradead.org; Thu, 23 May 2019 23:18:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id h19so1538243ljj.4
 for <ath10k@lists.infradead.org>; Thu, 23 May 2019 16:18:26 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id z129sm235282lfd.81.2019.05.23.16.18.23
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 16:18:23 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id q62so7007607ljq.7
 for <ath10k@lists.infradead.org>; Thu, 23 May 2019 16:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190523071534.254611-1-tientzu@chromium.org>
 <CA+ASDXMaKpMWnLnKxeft-8eKfpM6qGDsmEzvh290JCCjeRRtxQ@mail.gmail.com>
In-Reply-To: <CA+ASDXMaKpMWnLnKxeft-8eKfpM6qGDsmEzvh290JCCjeRRtxQ@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 23 May 2019 16:18:11 -0700
Message-ID: <CA+ASDXPn4fJeqnupzXqJqqCiSZfKqD827OUHg+VFrENfjrLzqQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add missing error handling
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
To: Claire Chang <tientzu@chromium.org>
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>

On Thu, May 23, 2019 at 9:42 AM Brian Norris <briannorris@chromium.org> wrote:
> IIUC, you have basically the same failure case a few lines up, where
> ath10k_sdio_mbox_alloc_pkt_bundle() may fail. Do the same there?

Oh, I see Erik Stromdahl already got that one:

ath10k: sdio: add missing error check
https://patchwork.kernel.org/patch/10906009/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
