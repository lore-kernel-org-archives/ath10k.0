Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAGPc-0000Uo-39
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 16:33:09 +0000
Received: by mail-lj1-x241.google.com with SMTP id e17so4153680ljf.13
 for <ath10k@lists.infradead.org>; Tue, 17 Sep 2019 09:33:07 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id u1sm514097lfi.83.2019.09.17.09.33.04
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 09:33:04 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id v24so4238918ljj.3
 for <ath10k@lists.infradead.org>; Tue, 17 Sep 2019 09:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
In-Reply-To: <20181114225910.GA220599@google.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 17 Sep 2019 09:32:52 -0700
Message-ID: <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Since Wen has once again suggested I use this patch in other forums,
I'll ping here to note:

On Wed, Nov 14, 2018 at 2:59 PM Brian Norris <briannorris@chromium.org> wrote:
> You've introduced a regression in 4.20-rc1:

This regression still survives in the latest tree. Is it fair to just
submit a revert?

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
