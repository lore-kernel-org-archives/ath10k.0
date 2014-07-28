Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBfRF-00047U-J1
 for ath10k@lists.infradead.org; Mon, 28 Jul 2014 07:33:42 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 28 Jul 2014 09:32:50 +0200
Subject: RE : RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D7F6@srvexch01.SODIELEC.local>
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
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>,
 <53D252B4.9070704@candelatech.com>
In-Reply-To: <53D252B4.9070704@candelatech.com>
Content-Language: fr-FR
MIME-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>, Adrian Chadd <adrian@freebsd.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>

>> My 2 devices have an ARM processor 1200MHz.
>> If I connect these two devices by an Ethernet cable and doing iperf (in TCP)
>> I can obtain 880 Mbps, it means that my processor can deal with that speed
>> of data transfer. But if I use Wi-fi instead of Ethernet to test rate between these
>> devices, my processor is exhausted, I run command top and see that 0~1%
>> idle only,  ksoftirqd and kworker take most of my processor resource.
>>
>> Last week I discovered by chance that the module loaded in kernel can create
>> effects to performance of rate, in my case it is "iptables". If I unload all module
>> that related to iptables I can improve the performance.
>> So I wonder if I can do some thing with the Wi-fi driver to  improve rate?
>> Or the only solution is overclock/change my processor?

>Can you run 'perf top' on your system when it is under load so we can
>see where the CPU is being used the most?

It's complicated for me to install "perf" cause it depends on the package linux-tools (please
correct me if I'm wrong :D)and our linux kernel is provided from the processor's producer.
I don't see the option to build "perf" form the menuconfig of our linux. I've enabled these parameters
but still when I run perf from shell there is no program found.

CONFIG_HAVE_PERF_EVENTS=y   
CONFIG_EVENT_TRACING=y     
CONFIG_PERF_EVENTS=y       
CONFIG_PERF_COUNTERS=y     

I can only run "top" to see what process used most of out CPU, they are  ksoftirqd and kworker.

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
