Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcgVw-0003Rp-6l
 for ath10k@lists.infradead.org; Sun, 24 May 2020 02:37:25 +0000
Received: by mail-ot1-x342.google.com with SMTP id v17so11453056ote.0
 for <ath10k@lists.infradead.org>; Sat, 23 May 2020 19:37:22 -0700 (PDT)
From: Michael Berg <michaeljberg@gmail.com>
Subject: Re: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
Message-ID: <24512086-0248-d273-5255-7d6504b0ad2c@gmail.com>
Date: Sat, 23 May 2020 20:37:21 -0600
MIME-Version: 1.0
Content-Language: en-US
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
To: ath10k@lists.infradead.org, nick@marriott.org, wgong@codeaurora.org, kvalo@codeaurora.org

More follow up on the following patch that broke 5GHz AP mode on Compex
cards
https://github.com/torvalds/linux/commit/2dc016599cfa9672a147528ca26d70c3654a5423

I just downloaded and checked the linux-5.7-rc6 kernel source,
and the problematic code is still in drivers/net/wireless/ath/regd.c.

Are they any updates on when this patch will be corrected/reverted?

Thank you for you time.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
