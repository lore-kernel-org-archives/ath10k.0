Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAey3-0004zA-R0
 for ath10k@lists.infradead.org; Fri, 25 Jul 2014 12:51:24 +0000
Message-ID: <53D252B4.9070704@candelatech.com>
Date: Fri, 25 Jul 2014 05:51:00 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : Trouble shooting low rate MCS9 in 802.11ac
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EE@srvexch01.SODIELEC.local>,
 <CAJ-Vmon+TC_TouvoAX3kZT5x+crrStHLmcjCfOeGHvC5eszbTA@mail.gmail.com>,
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Adrian Chadd <adrian@freebsd.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>



On 07/25/2014 05:22 AM, Vu Hai NGUYEN wrote:
>>>> So probably the air condition you have forces the rate control to pick
>>>> MCS7 as the most suitable rates.
>
>>> What could I do to improve this? (Change the air conditioner LOL?)
>
>> Heh, he meant the RF environment in the location you are. :)
>> And ugh - this is why we need an open source ART already.
>
> My 2 devices have an ARM processor 1200MHz.
> If I connect these two devices by an Ethernet cable and doing iperf (in TCP)
> I can obtain 880 Mbps, it means that my processor can deal with that speed
> of data transfer. But if I use Wi-fi instead of Ethernet to test rate between these
> devices, my processor is exhausted, I run command top and see that 0~1%
> idle only,  ksoftirqd and kworker take most of my processor resource.
>
> Last week I discovered by chance that the module loaded in kernel can create
> effects to performance of rate, in my case it is "iptables". If I unload all module
> that related to iptables I can improve the performance.
> So I wonder if I can do some thing with the Wi-fi driver to  improve rate?
> Or the only solution is overclock/change my processor?

Can you run 'perf top' on your system when it is under load so we can
see where the CPU is being used the most?

Thanks,
Ben

>
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
>
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
