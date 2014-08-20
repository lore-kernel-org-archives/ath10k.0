Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XK6eM-0005s8-Dq
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 14:14:08 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Wed, 20 Aug 2014 16:13:13 +0200
Subject: RE : RE : RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241014DDDD4DC37@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EE@srvexch01.SODIELEC.local>
 <CAJ-Vmon+TC_TouvoAX3kZT5x+crrStHLmcjCfOeGHvC5eszbTA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
 <53D252B4.9070704@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F8@srvexch01.SODIELEC.local>
 <53D6757A.8040803@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7FE@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D800@srvexch01.SODIELEC.local>,
 <CA+BoTQ=QscHgrk5bbWugjdnVGh=T_L-psEPKToYHOdKGcQZi7A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241014DDDD4DC35@srvexch01.SODIELEC.local>,
 <53F396F1.8070906@candelatech.com>
In-Reply-To: <53F396F1.8070906@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Adrian Chadd <adrian@freebsd.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>

>> I'd cleaned all rules of iptables and removed all modules of iptables from kernel by command modprobe -r
>> But there's still some process of netfilter process running. I disabled netfilter on bridge interface by writing 0 to these files:
>> /proc/sys/net/bridge/bridge-nf-call-arptables
>> /proc/sys/net/bridge/bridge-nf-call-iptables
>> /proc/sys/net/bridge/bridge-nf-call-ip6tables
>>
>> and the performance increases from 500 to 550 Mbps (iperf in tcp reports between 530 ~ 570Mbps).
>> There is no more process like  "br_nf_pre_routing" and "br_nf_forward_ip".
>> Do you think I can do anything more to strip down netfilter?

>What do you get for UDP?  That seems like pretty good TCP throughput.

In VHT80 mode and rate forced to NSS3:MCS7, I can obtain 750 Mbps with less than 1% data lost (in both way, AP to STA and vice versa).
Normally I can obtain 2/3 theory rate in practical (for expl NSS3:MCS3 has 390 Mbps in theory, and if I force to that rate, my TCP throughput
is around 270 Mbps). So I should obtain 650 Mbps in practical for TCP with NSS3:MCS7 (975 Mbps in theory). 
570 Mbps is so far to 650 Mbps :(

>Also, do you get different results if you use Open v/s WPA2 encryption?

>A test I just ran showed decreased performance on one of my systems
>when I ran with open v/s wpa2 (400Mbps v/s 350Mbps, UDP goodput).
>This was using hardware-crypt, so I expected it to be as fast as Open.
>I'm running customized firmware and driver, so maybe that is cause of
>slowdown...curious what results others are seeing though!

In my case, I don't get much differences between Open vs WPA2 encryption, rate is almost the same (different around 10 ~ 20 Mbps and hard to see)

>> I installed tc from package iproute2 and did : tc qdisc but it doesn't improve the performance
>> One more question: Could the antennas create any effect on the MCS in use?
>> We are using this antenna from PCTEL:
>> http://www.antenna.com/apg_products.cgi?id_num=11395
>> And in the specification, I saw that it supports the standard 802.11n, so may be this is the reason
>> that the best rate for me is MCS7?

>Antenna and orientation matter, but the one you list advertises itself
>as dual-band, so it looks like it should work well in the 5Ghz band
>that AC uses.
>You might try changing orientation and/or trying some different antenna.

That antenna has 6 access so I connect my AP and STA to that antenna, it means
that they are very close to each other. I've tried to connect my STA with others 3 smalls 
antennas dual band (http://www.senetic.fr/product/AIR-ANT2524DB-R?gclid=Cj0KEQjwjtGfBRCN4-LU9ODG1-wBEiQAy_Xp73JtC1W_cG1EyI_mft_OrR5qBD_qqDzslQMB8BMaXQQaAkAq8P8HAQ)
and change direction but the rate I obtain is much lower, I can not reach high throughput as above.
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
