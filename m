Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEekp-0003w1-Kw
 for ath10k@lists.infradead.org; Sat, 27 May 2017 16:39:53 +0000
Received: by mail-wr0-x236.google.com with SMTP id j27so15735586wre.1
 for <ath10k@lists.infradead.org>; Sat, 27 May 2017 09:39:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <21095854-07c7-7586-6a6e-e60c11932b84@candelatech.com>
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
 <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <21095854-07c7-7586-6a6e-e60c11932b84@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Sat, 27 May 2017 09:39:29 -0700
Message-ID: <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
Subject: Re: [PATCH] Per chain RSSI reporting
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
Cc: Norik Dzhandzhapanyan <norikd@ethertronics.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 27 May 2017 at 09:07, Ben Greear <greearb@candelatech.com> wrote:
> At low encoding rates, especially if it switches to a single-chain encoding,
> maybe the on-air signal really is stronger?
>
> Have you verified in some other manner than the signals reported by ath10k
> are
> wrong?

Hiya,

So yeah, multipath, higher TX rates == weaker TX signal, TPC, etc are
all interesting to know about at the receiver. it's hard to separate
that out from the noise sometimes, but in some controlled deployments
its really obvious.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
