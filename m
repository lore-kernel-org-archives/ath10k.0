Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdzOS-0000Rm-9P
 for ath10k@lists.infradead.org; Wed, 27 May 2020 16:59:05 +0000
Received: by mail-lf1-x141.google.com with SMTP id e125so14900279lfd.1
 for <ath10k@lists.infradead.org>; Wed, 27 May 2020 09:59:04 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id h26sm914280lja.0.2020.05.27.09.59.01
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 09:59:02 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id x27so14872981lfg.9
 for <ath10k@lists.infradead.org>; Wed, 27 May 2020 09:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <24512086-0248-d273-5255-7d6504b0ad2c@gmail.com>
In-Reply-To: <24512086-0248-d273-5255-7d6504b0ad2c@gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 27 May 2020 09:58:49 -0700
Message-ID: <CA+ASDXNmOvygoKMLOS_saJAzv0oJbYq+u1_6ix-FKbb9U=GB+g@mail.gmail.com>
Subject: Re: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
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
To: Michael Berg <michaeljberg@gmail.com>
Cc: nick@marriott.org, Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

On Sat, May 23, 2020 at 7:37 PM Michael Berg <michaeljberg@gmail.com> wrote:
>
> More follow up on the following patch that broke 5GHz AP mode on Compex
> cards
> https://github.com/torvalds/linux/commit/2dc016599cfa9672a147528ca26d70c3654a5423
>
> I just downloaded and checked the linux-5.7-rc6 kernel source,
> and the problematic code is still in drivers/net/wireless/ath/regd.c.
>
> Are they any updates on when this patch will be corrected/reverted?

I submitted a revert here:

https://patchwork.kernel.org/patch/11573585/

Hopefully Kalle can pick that up. Thanks for reporting.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
