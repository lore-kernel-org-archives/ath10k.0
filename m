Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.g8.pair.com ([66.39.4.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEfxm-0003s6-Ll
 for ath10k@lists.infradead.org; Sat, 27 May 2017 17:57:20 +0000
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] Per chain RSSI reporting
From: Michael Ney <neym@vorklift.com>
In-Reply-To: <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
Date: Sat, 27 May 2017 13:56:54 -0400
Message-Id: <4A8583B3-FFB2-4BDE-8041-9478CAD9EF73@vorklift.com>
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
 <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <21095854-07c7-7586-6a6e-e60c11932b84@candelatech.com>
 <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Ben Greear <greearb@candelatech.com>, Norik Dzhandzhapanyan <norikd@ethertronics.com>, Adrian Chadd <adrian@freebsd.org>

The submitted code also doesn't appear to handle RSSI per-peer which would be needed for any use when configured as an access point.

> On May 27, 2017, at 12:39 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> 
> On 27 May 2017 at 09:07, Ben Greear <greearb@candelatech.com> wrote:
>> At low encoding rates, especially if it switches to a single-chain encoding,
>> maybe the on-air signal really is stronger?
>> 
>> Have you verified in some other manner than the signals reported by ath10k
>> are
>> wrong?
> 
> Hiya,
> 
> So yeah, multipath, higher TX rates == weaker TX signal, TPC, etc are
> all interesting to know about at the receiver. it's hard to separate
> that out from the noise sometimes, but in some controlled deployments
> its really obvious.
> 
> 
> 
> -adrian
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
