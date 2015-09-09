Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZk1B-0001Ug-Mn
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 18:22:50 +0000
Message-ID: <55F078E4.2050409@candelatech.com>
Date: Wed, 09 Sep 2015 11:22:28 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [SPAM] Re: WLE600VX from PCEngines
References: <CAGNwC3mbOJcEyrJGB8vcQ8Sa7ip-g+TcuCG9Ksm+8xYvAqiQ6w@mail.gmail.com>
 <CALhHN=rHMicEVMWrHowFwt+U+EwsKeh03SKGfoHtpD+_kKj_4w@mail.gmail.com>
 <55EFCFC8.4050303@cttc.es>
 <CALhHN=p71pLTUWJLB3Tnt--D0JbWXjw5vafhT=GjmGek_D1CYw@mail.gmail.com>
 <CAGNwC3kzphTT2f7p8HT44V_3Lo08j3Q774ObRVFj4Q81Z6yWjg@mail.gmail.com>
 <CAGNwC3kLtBs3pYFPfVZkzxzZUyk_m188hZid59ra0R+miVJw7w@mail.gmail.com>
 <55F01104.6010600@tu-bs.de> <55F01328.4070403@cttc.es>
 <55F014CF.6090809@tu-bs.de>
 <CAGNwC3knEkjqvUE_0NQsnsXRpbxc4ZYJghbCBqdM78roaM-oVQ@mail.gmail.com>
 <CAGNwC3nyHCkmhOcYF31MCRXxoE7PsJ==rz=ohLwCNiZNokQxtw@mail.gmail.com>
In-Reply-To: <CAGNwC3nyHCkmhOcYF31MCRXxoE7PsJ==rz=ohLwCNiZNokQxtw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Marcel H." <maco@blava.net>, ath10k@lists.infradead.org

On 09/09/2015 04:40 AM, Marcel H. wrote:
> One other things comes to mind - whats the relationship between the
> Candelatech's kernel branch and the kvalo's
> https://github.com/kvalo/ath/ ?
> Using the 'main' firmware for ath10k (to support IBSS ad-hoc mode) Im
> not entirely sure which kernel is leading development of the ath10k
> driver.

CT kernels are normally based on upstream (Linus) kernels, but I do sometimes
grab patches from kvalo/ath.

In general, CT kernels have support for some additional features that CT
firmware provides (that are not necessarily available in official ath10k firmware).

>
> Also, is 636 firmware the best / latest / recommended the most for the
> IBSS mode? Or shall I have a look into other version from Candelatech
> / Kvalos repo?

I'm biased, but I think CT firmware would be a better choice that 636,
especially if you can run our CT kernel patches.

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
