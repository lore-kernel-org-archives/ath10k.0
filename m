Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCArD-0006xk-Lz
 for ath10k@lists.infradead.org; Mon, 15 Oct 2018 21:57:01 +0000
Received: by mail-lj1-x242.google.com with SMTP id r8-v6so18924997ljc.10
 for <ath10k@lists.infradead.org>; Mon, 15 Oct 2018 14:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <1537766878-11238-1-git-send-email-vnaralas@codeaurora.org>
 <87va672nib.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87va672nib.fsf@kamboji.qca.qualcomm.com>
From: Kan Yan <kyan@google.com>
Date: Mon, 15 Oct 2018 14:56:33 -0700
Message-ID: <CA+iem5v7HUuPeXv5bG9=xhW_yhyUvq4R+Ybw+wBm1Niha77iqA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Add wrapper function to ath10k debug
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
To: kvalo@codeaurora.org
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

> Johannes had an interesting idea to use trace_ath10k_log_dbg_enabled().
> Could you investigate if that would work? That way we might get the
> performance improvement even when is enabled CONFIG_ATH10K_TRACING (but
> actual trace point is disabled, of course).

That's a good idea. This patch was originally made for Google Wifi's
3.18 kernel and It does use trace_ath10k_log_dbg_enabled():
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/391891
+#define ath10k_dbg(ar, mask, format, ...)                              \
+       do {                                                            \
+               if (unlikely((ath10k_debug_mask & mask) ||              \
+                             trace_ath10k_log_dbg_enabled())) {        \
+                       __ath10k_dbg(ar, mask, format, ##__VA_ARGS__);  \
+               }                                                       \
+       } while (0)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
