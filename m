Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCZ3j-0001ia-Tt
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 23:47:33 +0000
Received: by mail-ed1-x542.google.com with SMTP id v18-v6so23064742edq.12
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:47:21 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53])
 by smtp.gmail.com with ESMTPSA id dv2-v6sm3244276ejb.10.2018.10.16.16.47.18
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 16:47:18 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id z21-v6so23067573edb.11
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <CAD=FV=UmvnsueUbDTa-vSp5Ay+8Zo0YORW8T7u1AwreUbZA4+Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UmvnsueUbDTa-vSp5Ay+8Zo0YORW8T7u1AwreUbZA4+Q@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 16 Oct 2018 16:47:05 -0700
Message-ID: <CA+ASDXO6PMudAkt0BTXRh8GjmheYvge+smYdr-n=pdBP5swJrA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
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
To: Doug Anderson <dianders@chromium.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, govinds@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

On Tue, Oct 16, 2018 at 4:43 PM Doug Anderson <dianders@chromium.org> wrote:
> On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > ath10k_wcn3990_clk_info and ath10k_wcn3990_vreg_info are not
> > WCN3990-specific structures. They hold generic data. So don't name them
> > with wcn3990 specifics.
> >

> > -static struct ath10k_wcn3990_vreg_info vreg_cfg[] = {
> > +static struct ath10k_vreg_info vreg_cfg[] = {
>
> Ironically, you could sorta make the argument that this should be:
>
> static struct ath10k_vreg_info wcn3990_vreg_cfg

Hehe, good point.

> AKA the "wcn3990" shouldn't be in the name of the structure (since all
> snoc devices can have the concept of an array of regulators) but
> wcn3990 could be in the name of the variable since it's possible that
> different snoc devices could have different arrays.  However I'm OK w/
> waiting to do that part until we actually see a different snoc device
> with a different array.

But I think that is a pretty reasonable conclusion.

There's still some other strange stuff in this driver too, like the
fact that this is NOT a const array -- we assign things dynamically to
the regulator fields within the array -- that we would probably want
to fix if this is really supposed to be a generic multi-IP driver.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
