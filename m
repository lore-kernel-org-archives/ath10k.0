Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZdL5-0005Rc-Fr
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 11:14:55 +0000
Message-ID: <55F0149B.50300@candelatech.com>
Date: Wed, 09 Sep 2015 04:14:35 -0700
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
In-Reply-To: <55F01328.4070403@cttc.es>
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
To: Jorge Baranda <jbaranda@cttc.es>, ath10k@lists.infradead.org

On 09/09/2015 04:08 AM, Jorge Baranda wrote:
> Hi,
>
> Good news!! Harms, could you share full wpa_supplicant configuration files?
> (for both computers).
> I will download the latest version of wpa_supplicant, apply your changes and try
> to make work IBSS mode and 80MHz with Candela Kernel 4.0.

If you are using our kernel, you probably want to use our CT ath10k firmware
as well.  Otherwise, you might as well stick with stock upstream
kernels for most applications.

http://www.candelatech.com/ath10k.php

We do most testing with WLE900VX, but I think WLE600VX should also
work OK.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
