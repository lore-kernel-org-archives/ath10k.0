Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiNMY-0004ot-WE
 for ath10k@lists.infradead.org; Tue, 02 Jul 2019 18:18:44 +0000
Received: by mail-ed1-x542.google.com with SMTP id k8so28186852eds.7
 for <ath10k@lists.infradead.org>; Tue, 02 Jul 2019 11:18:41 -0700 (PDT)
Date: Tue, 2 Jul 2019 11:18:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: -Wsometimes-uninitialized warning after
 8b97b055dc9db09b48d5a9a37d847900dd00d3cc
Message-ID: <20190702181837.GA118849@archlinux-epyc>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Miaoqing Pan <miaoqing@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, clang-built-linux@googlegroups.com

Hi all,

After commit 8b97b055dc9d ("ath10k: fix failure to set multiple fixed
rate") in -next, clang warns:

../drivers/net/wireless/ath/ath10k/mac.c:7528:7: warning: variable 'vht_pfr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/wireless/ath/ath10k/mac.c:7551:20: note: uninitialized use occurs here
                arvif->vht_pfr = vht_pfr;
                                 ^~~~~~~
../drivers/net/wireless/ath/ath10k/mac.c:7528:3: note: remove the 'if' if its condition is always true
                if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the variable 'vht_pfr' to silence this warning
        u8 vht_pfr;
                  ^
                   = '\0'
1 warning generated.

This definitely seems legitimate as the call to
ath10k_mac_can_set_bitrate_mask might fail and vht_pfr
won't be initialized. I would fix this myself but I assume
there is a sane default value for vht_pfr other than just
0 that should be used?

Please look into this when you get a chance. Thanks,
Nathan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
