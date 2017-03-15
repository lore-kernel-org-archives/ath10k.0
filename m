Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coBmP-0006Rk-8K
 for ath10k@lists.infradead.org; Wed, 15 Mar 2017 16:28:08 +0000
Received: by mail-wr0-x230.google.com with SMTP id u48so14609735wrc.0
 for <ath10k@lists.infradead.org>; Wed, 15 Mar 2017 09:27:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a22597d0-f0b0-9536-5753-c1bed7a5f20d@candelatech.com>
References: <a22597d0-f0b0-9536-5753-c1bed7a5f20d@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 15 Mar 2017 09:27:42 -0700
Message-ID: <CAJ-VmokwWxw8BaZHgyfC6D_66WX74ytxPQca+dqCfd7Cb7_UUA@mail.gmail.com>
Subject: Re: Should ath10k enable RX_FLAG_ALLOW_SAME_PN
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

have you verified with a sniffer that it indeed is an A-MSDU that the
hardware is decap'ing for you?

(ath9k doesn't do hardware A-MSDU decap.)

-adrian


On 15 March 2017 at 08:26, Ben Greear <greearb@candelatech.com> wrote:
> We notice a strange problem when receiving ath10k frames in
> raw mode (with modified firmware).
>
> The very first data message (UDP discovery response) is dropped
> in WPA2 + AES mode, and it appears that if we would set the
> RX_FLAG_ALLOW_SAME_PN it would be accepted.  ath9k in software-crypt
> mode does not have this issue as far as we can tell.
>
> So, maybe ath10k should set this flag??
>
> Here is commit ID from the logic that introduced this flag, in case
> that helps jog some memory.
>
> commit f631a77ba920f7153a1094d09cd8f2ebbffd0328
> Author: Sara Sharon <sara.sharon@intel.com>
> Date:   Tue May 3 15:59:44 2016 +0300
>
>     mac80211: allow same PN for AMSDU sub-frames
>
>     Some hardware (iwlwifi an example) de-aggregate AMSDUs and copy the IV
>     as is to the generated MPDUs, so the same PN appears in multiple
>     packets without being a replay attack.  Allow driver to explicitly
>     indicate that a frame is allowed to have the same PN as the previous
>     frame.
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
