Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kajOj-0002bG-8V
 for ath10k@lists.infradead.org; Thu, 05 Nov 2020 17:50:27 +0000
Received: by mail-lf1-x143.google.com with SMTP id b1so3530576lfp.11
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2020 09:50:06 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id q14sm246081lfb.281.2020.11.05.09.50.02
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 09:50:03 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id y16so2498110ljk.1
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2020 09:50:02 -0800 (PST)
MIME-Version: 1.0
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <1600753775-4745-2-git-send-email-cjhuang@codeaurora.org>
 <20201104231128.GA3212577@google.com>
 <6563d6ac38368de40cd07ae36f230a86@codeaurora.org>
In-Reply-To: <6563d6ac38368de40cd07ae36f230a86@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 5 Nov 2020 09:49:49 -0800
Message-ID: <CA+ASDXMAqF=OWDoQBD=WbwG9WmZsJwmOcjLESkRnLBu6GgqyHQ@mail.gmail.com>
Subject: Re: [RFC 2/2] ath10k: allow dynamic SAR power limits via common API
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Abhishek Kumar <kuabhs@google.com>

On Thu, Nov 5, 2020 at 3:27 AM Carl Huang <cjhuang@codeaurora.org> wrote:
> On 2020-11-05 07:11, Brian Norris wrote:
> > On Tue, Sep 22, 2020 at 01:49:35PM +0800, Carl Huang wrote:
> >> +    if (ar->tx_power_2g_limit == 0 || ar->tx_power_5g_limit == 0)
> >
> > ath10k_mac_txpower_recalc() doesn't care about this -- why should you?
> > This also seems especially weird, because one of the 2 could be valid
> > nonzero values, and yet you're silently rejecting it. Regardless, the
> > following seems wrong:
> >
> Per current design, it's required for userspace to always set meaningful
> power limitations.

Well, that wasn't specified anywhere (in the docs nor in the nl80211
implementation); if one wanted to enforce that, it should probably go
in the nl80211 layer, not the driver implementation. Otherwise, we're
very prone to varying driver implementations (not a good thing).

> Now in V2, 0 will be treated as "don't have SAR on this range".

OK... I guess that's reasonable, although that should be explicitly
called out in nl80211.h.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
